class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :genre, :source, :label

  def initialize(id, publish_date)
    @id = id
    @publish_date = publish_date
    @archived = false
    @genre = nil
    @source = nil
    @label = nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def source=(source)
    @source = source
    source.add_item(self) unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end
  private :can_be_archived?
end
