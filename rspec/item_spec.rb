require_relative '../item'
require_relative '../genre'
require_relative '../author'
require_relative '../source'
require_relative '../label'
require 'date'
require 'rspec'

RSpec.describe Item do
  let(:publish_date) { Date.new(2017, 1, 1) }
  subject(:item) { Item.new(publish_date) }

  describe '#initialize' do
    it 'should create an instance of Item with id, genre, author, source, label, publish_date, archived' do
      expect(item).to be_an_instance_of(Item)
      expect(item.publish_date).to eq(publish_date)
      expect(item.archived).to eq(false)
      expect(item.genre).to be_nil
      expect(item.author).to be_nil
      expect(item.source).to be_nil
      expect(item.label).to be_nil
    end
  end

  describe '#genre=' do
    it 'sets the genre of an item' do
      genre = Genre.new('Action')
      item.genre = genre
      expect(item.genre).to eq(genre)
      expect(genre.items).to include(item)
    end
  end

  describe '#author=' do
    it 'sets the author of an item' do
      author = Author.new('Ngala', 'Mac')
      item.author = author
      expect(item.author).to eq(author)
      expect(author.items).to include(item)
    end
  end

  describe '#source=' do
    it 'sets the source of an item' do
      source = Source.new('Netflix')
      item.source = source
      expect(item.source).to eq(source)
      expect(source.items).to include(item)
    end
  end

  describe '#label=' do
    it 'sets the label of an item' do
      label = Label.new('Netflix', 'blue')
      item.label = label
      expect(item.label).to eq(label)
      expect(label.items).to include(item)
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if the item is older than 10 years' do
      item.publish_date = Date.today - (11 * 365)
      expect(item.send(:can_be_archived?)).to eq(true)
    end

    it 'should return false if the item is less than 10 years' do
      item.publish_date = Date.today - (9 * 365)
      expect(item.send(:can_be_archived?)).to eq(false)
    end
  end

  describe '#move_to_archive?' do
    it 'archives the item if it is supposed to be archived' do
      item.publish_date = Date.today - (11 * 365)
      item.move_to_archive?
      expect(item.archived).to eq(true)
    end

    it 'does not archive the item if it is not supposed to be archived' do
      item.publish_date = Date.today - (9 * 365)
      item.move_to_archive?
      expect(item.archived).to eq(false)
    end
  end
end
