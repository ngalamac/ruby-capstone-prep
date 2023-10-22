class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(_id, first_name, last_name)
    @id = Random.rand(1..500)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    raise ArgumentError, 'Only instances of the Item class can be added to the items array.' unless item.is_a?(Item)

    @items << item unless @items.include?(item)
    item.author = self
  end
end
