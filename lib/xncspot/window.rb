module Xncspot
    class Window
        def initialize(window_class)
            @window_class = window_class
        end

        def get_window_id
            loop do
                id = `xdotool search --class '^#{@window_class}$'`.chomp
                if !id.empty?
                    if id.lines.length > 1
                        exit 1
                    end
                    return id
                end
                sleep(1)
            end
        end

        def window_id
            @window_id ||= get_window_id
        end

        def set_title(meta)
            system('xdotool', 'set_window', '--name', meta.to_s, window_id)
        end
    end
end
