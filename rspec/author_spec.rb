require_relative '../author'
require_relative '../item'
require 'rspec'
require 'date'

RSpec.describe Author do
  describe '#initialize' do
    let(:author) { Author.new('Ngala', 'Mac') }

    it 'should create an instance of Author' do
      expect(author).to be_an_instance_of(Author)
    end

    it 'sets the id, first_name, last_name, and items attributes' do
      expect(author.first_name).to eq('Ngala')
      expect(author.last_name).to eq('Mac')
      expect(author.items).to eq([])
    end
  end

  describe '#add_item' do
    let(:author) { Author.new('Ngala', 'Mac') }
    let(:item) { Item.new(Date.today) }

    it 'should add an item to the items array' do
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'sets the item author to self' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end

    it 'raises an error if the argument is not an instance of the Item class' do
      expect { author.add_item('item') }.to raise_error(ArgumentError)
    end

    it 'does not add items that already exist in the items array' do
      author.add_item(item)
      author.add_item(item)
      expect(author.items).to eq([item])
    end
  end
end
