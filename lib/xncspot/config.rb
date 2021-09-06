module Xncspot
    class Config
        def load_config
            path = File.expand_path('~/.config/xncspot/config.yml')

            if !File.directory?(File.dirname(path))
                FileUtils.mkdir_p(File.dirname(path))
            end

            YAML.load_file(path)
        end

        def config
            @config ||= load_config
        end

        def get(key, default = nil)
            config[key].nil? ? default : config[key]
        end
    end
end
