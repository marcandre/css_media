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
      Result.new(css + "\n// yay\n")
    end
  end
end
