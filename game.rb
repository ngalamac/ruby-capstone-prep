class Game < Item
    attr_accessor :multiplayer, :lastplayed_at_date
    def initialize(id, publish_date, multiplayer, lastplayed_at_date)
        super(id, publish_date)
        @multiplayer = multiplayer
        @lastplayed = lastplayed_at_date
    end
    private
    def can_be_archived?
        super || @lastplayed_at_date == true
    end
end