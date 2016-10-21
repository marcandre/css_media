require "css_media/version"

module CssMedia
  autoload :Sprockets, 'css_media/sprockets'

  # Add prefixes to `css`. See `Processor#process` for options.
  def self.process(css, opts = { })
    params = { }
    # params[:browsers] = opts.delete(:browsers) if opts.has_key?(:browsers)
    Processor.new(params).process(css, opts)
  end

  # Add Autoprefixer for Sprockets environment in `assets`.
  # You can specify `browsers` actual in your project.
  def self.install(assets, opts = {})
    Sprockets.register_processor(Processor.new(opts))
    Sprockets.install(assets)
  end

  # Disable installed Autoprefixer
  def self.uninstall(assets)
    Sprockets.uninstall(assets)
  end
end

require_relative 'css_media/result'
require_relative 'css_media/version'
require_relative 'css_media/processor'

require_relative 'css_media/railtie' if defined?(Rails)
