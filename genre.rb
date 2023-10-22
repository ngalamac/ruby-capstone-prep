class Genre
    attr_accessor: items, :name
    attr_reader: id
    def initialize(id, name)
        @id = id : Random.rand(1..500)
        @name = name
        @items = []
    end

    def add_item(item)
        if item.is_a?(Item)
            @items << item unless @items.include?(item)
            item.genre = self
        else
            raise ArgumentError, "Invalid argument. Only instances of the Item class can be added to the items array."
        end
    end
end