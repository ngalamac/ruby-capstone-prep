class Movie < Item
  attr_accessor :silet

  def initialize(id, publish_date, silet)
    super(id, publish_date)
    @silet = silet
  end

  private

  def can_be_archived?
    super || @silet == true
  end
end
