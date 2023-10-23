class Source
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @id = Random.rand(1..500)
    @name = name
    @items = []
  end

  def add_item(item)
    raise ArgumentError, 'Only instances of the Item class can be added to the items array.' unless item.is_a?(Item)

    @items << item unless @items.include?(item)
    item.source = self
  end
end
