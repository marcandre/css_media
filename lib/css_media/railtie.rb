require 'yaml'

begin
  module CssMedia
    class Railtie < ::Rails::Railtie
      if config.respond_to?(:assets) and not config.assets.nil?
        config.assets.configure do |env|
          CssMedia.install(env, config(env.root))
        end
      else
        initializer :setup_css_media, group: :all do |app|
          if defined? app.assets and not app.assets.nil?
            CssMedia.install(app.assets, config(app.root))
          end
        end
      end

      # Read browsers requirements from application config
      def config(root)
        file   = File.join(root, 'config/css_media.yml')
        params = ::YAML.load_file(file) if File.exist?(file)
        params ||= {}
        params = params.symbolize_keys
        params
      end
    end
  end
rescue LoadError
end
