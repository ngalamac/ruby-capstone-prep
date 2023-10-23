class Game < Item
  attr_accessor :multiplayer, :lastplayed_at_date

  def initialize(publish_date, multiplayer, lastplayed_at_date)
    super(publish_date)
    Random.rand(1..1000)
    @multiplayer = multiplayer
    @lastplayed_at_date = lastplayed_at_date
  end

  private

  def can_be_archived?
    super || @lastplayed_at_date < Date.today - (2 * 365)
  end
end
