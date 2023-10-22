class Author
    attr_accessor :first_name, :last_name, :items
    attr_reader :id
    def initialize(id, first_name, last_name)
        @id = id : Random.rand(1..500)
        @first_name = first_name
        @last_name = last_name
        @items = []
    end
    def add_item(item)
        if item.is_a?(Item)
            @items << item unless @items.include?(item)
            item.author = self
        else
            raise ArgumentError, "Only instances of the Item class can be added to the items array."
        end
    end 
end
