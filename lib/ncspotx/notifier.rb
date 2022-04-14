module Ncspotx
    class Notifier
        def initialize
            @deduper = Deduper.new
        end

        def show(meta)
            config = Config.new.get('notifier', {})

            if !config['enabled']
                return
            end

            args = ['notify-send']

            if config['title']
                args << config['title']
            end

            args << meta.song

            if config['timeout']
                args << ['--expire-time', config['timeout'].to_s]
            end

            if config['icon']
                args << ['--icon', File.expand_path(config['icon'])]
            end

            system(*args.flatten)
        end

        def notify(meta)
            if meta.status != 'Playing'
                return
            end

            if @deduper.duplicate?(meta)
                return
            end

            show(meta)
        end
    end
end
