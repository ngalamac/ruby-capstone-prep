require_relative '../item'
require_relative '../genre'
require 'date'
require 'rspec'

RSpec.describe Genre do
  let(:name) { 'Action' }
  subject(:genre) { Genre.new(name) }
  describe '#initialize' do
    it 'should create an instance of Genre with an id, name and items' do
      expect(genre).to be_an_instance_of(Genre)
      expect(genre.name).to eq(name)
      expect(genre.items).to eq([])
    end
    describe '#add_item' do
      it 'should add an item to the items array' do
        item = Item.new(Date.today)
        genre.add_item(item)
        expect(genre.items).to include(item)
        expect(item.genre).to eq(genre)
      end
      it 'should not add an item that already exists in the items array' do
        item = Item.new(Date.today)
        genre.add_item(item)
        genre.add_item(item)
        expect(genre.items).to eq([item])
      end
      it 'should raise an error if the argument is not an instance of the Item class' do
        expect { genre.add_item('item') }.to raise_error(ArgumentError)
      end
    end
  end
end
