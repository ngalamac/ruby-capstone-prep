class Genre
  attr_accessor :items, :name
  attr_reader :id

  def initialize(_id, name)
    @id = Random.rand(1..500)
    @name = name
    @items = []
  end

  def add_item(item)
    unless item.is_a?(Item)
      raise ArgumentError, 'Invalid argument. Only instances of the Item class can be added to the items array.'
    end

    @items << item unless @items.include?(item)
    item.genre = self
  end
end
