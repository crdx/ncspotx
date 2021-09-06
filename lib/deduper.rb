class Deduper
    @last = nil

    def duplicate?(item)
        is_dupe = item == @last
        @last = item
        is_dupe
    end
end
