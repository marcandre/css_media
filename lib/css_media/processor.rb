require 'crass'

module CssMedia
  class Processor

    def initialize(params = { })
      @params = params || { }
    end

    # Process `css` and return result.
    #
    # Options can be:
    # * `from` with input CSS file name. Will be used in error messages.
    # * `to` with output CSS file name.
    # * `map` with true to generate new source map or with previous map.
    def process(css, opts = { })
      fn = opts.fetch(:from, '').downcase.gsub('-', '_')
      if fn =~ /[^a-z](media_only|non?_media)[^a-z]/
        css = send($1, css)
      end
      Result.new(css)
    end

    private

    def is_media?(rule)
      # rule[:node] == :style_rule && rule[:selector][:value] =~ /^media\W/i
      rule[:node] == :at_rule && !!(rule[:name] =~ /media/i)
    end

    def filter_media(css, want_media)
      tree = Crass.parse(css, :preserve_comments => true)
      want = tree.select{|rule| is_media?(rule) == want_media}
      Crass::Parser.stringify(want)
    end

    def non_media(css)
      filter_media(css, false)
    end
    alias_method :no_media, :non_media

    def media_only(css)
      filter_media(css, true)
    end

  end
end
