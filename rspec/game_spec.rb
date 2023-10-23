require_relative '../item'
require_relative '../game'
require 'date'
require 'rspec'

RSpec.describe Game do
  let(:publish_date) { Date.new(2017, 1, 1) }
  let(:multiplayer) { true }
  let(:lastplayed_at_date) { Date.today - 1 }

  subject(:game) { described_class.new(publish_date, multiplayer, lastplayed_at_date) }

  describe '#initialize' do
    it 'sets the publish_date, multiplayer, and lastplayed_at_date' do
      expect(game.publish_date).to eq(publish_date)
      expect(game.multiplayer).to eq(multiplayer)
      expect(game.lastplayed_at_date).to eq(lastplayed_at_date)
    end
  end

  describe '#can_be_archived?' do
    context 'when the lastplayed_at_date is older than 2 years' do
      let(:lastplayed_at_date) { Date.today - (3 * 365) }

      it 'returns true' do
        expect(game.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when the lastplayed_at_date is within 2 years' do
      let(:lastplayed_at_date) { Date.today - (1 * 365) }

      it 'returns false' do
        expect(game.send(:can_be_archived?)).to eq(false)
      end
    end
  end
end
