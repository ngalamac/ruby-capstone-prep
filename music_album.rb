class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, publish_date, on_spotify)
    super(id, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super || @on_spotify == false
  end
end
