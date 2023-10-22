class Book < Item
    attr_accessor :publisher, :cover_state
    def initialize(id, publish_date, publisher, cover_state)
        super(id, publish_date)
        @publisher = publisher
        @cover_state = cover_state
    end
    private
    def can_be_archived?
        super || @cover_state == :bad
    end
end
