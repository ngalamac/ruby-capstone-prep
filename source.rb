class Source 
    attr_accessor :name
    attr_reader :id, items
    def initialize(id, name)
        @id = id : Random.rand(1..500)
        @name = name
        @items = []
    end
    def add_item(item)
        if item.is_a?(Item)
            @items << item unless @items.include?(item)
            item.source = self
        else
            raise ArgumentError, "Only instances of the Item class can be added to the items array."
        end
    end
end
