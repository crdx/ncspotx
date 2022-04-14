module Ncspotx
    class Metadata
        SEP = "\t"

        attr_reader :status
        attr_reader :artist
        attr_reader :title
        attr_reader :album

        def initialize(status, artist, title, album)
            @status = status
            @artist = artist
            @title = title
            @album = album
        end

        def ==(other)
            !other.nil? &&
                status == other.status &&
                artist == other.artist &&
                title == other.title &&
                album == other.album
        end

        def prefix
            case status
            when 'Playing'
                ''
            when 'Paused'
                '[Paused] '
            else
                '[Stopped] '
            end
        end

        def song
            if artist.nil? || artist.empty? || title.nil? || title.empty?
                ''
            else
                '%s - %s' % [artist, title]
            end
        end

        def to_s
            (prefix + song).strip
        end

        def to_json(*_args)
            {
                ts: Time.now.strftime('%F %T'),
                status: status,
                artist: artist,
                title: title,
                album: album,
            }.to_json
        end

        def valid?
            !artist.nil? && !title.nil?
        end

        def self.from(str)
            status, artist, title, album = str.split(SEP)
            Metadata.new(status, artist, title, album)
        end

        def self.get_format
            "{{ status }}#{SEP}{{ artist }}#{SEP}{{ title }}#{SEP}{{ album }}"
        end
    end
end
