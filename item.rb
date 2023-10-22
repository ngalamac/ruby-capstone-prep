class item
attr_accessor: id, :publish_date, :archived
attr_reader: genre, :source, :label

    def initialize(id, publish_date)
        @id = id
        @publish_date = publish_date
        @archived = false
        @genre = nil
        @source = nil
        @label = nil
    end

    def set_genre=(genre)
        @genre = genre
    end
    def set_source=(source)
        @source = source
    end
    def set_label=(label)
        @label = label
    end
    def can_be_archived?
        (Time.now.year - @publish_date.year) > 10
    end

    def move_to_archive?
        @archived = true if can_be_archived?
    end
    private :can_be_archived?
end
