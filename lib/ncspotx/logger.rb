module Ncspotx
    class Logger
        def initialize
            @deduper = Deduper.new
        end

        def log(meta)
            if meta.status != 'Playing'
                return
            end

            if @deduper.duplicate?(meta)
                return
            end

            config = Config.new.get('logger', {})

            if !config['enabled'] || !config['file']
                return
            end

            file = File.expand_path(config['file'])

            if !File.directory?(File.dirname(file))
                FileUtils.mkdir_p(File.dirname(file))
            end

            file = File.open(file, 'a+')
            file.print meta.to_json + "\n"
            file.close
        end
    end
end
