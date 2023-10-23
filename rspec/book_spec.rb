require_relative '../item'
require_relative '../book'
require 'date'
require 'rspec'

RSpec.describe Book do
  let(:publish_date) { Date.new(2017, 1, 1) }
  let(:publisher) { 'Ngala Mac' }
  let(:cover_state) { 'good' }

  subject(:book) { described_class.new(publish_date, publisher, cover_state) }

  describe '#initialize' do
    it 'sets the id, publish_date, publisher, and cover_state' do
      expect(book.publish_date).to eq(publish_date)
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
    end
  end

  describe '#can_be_archived?' do
    context 'when the cover state is in good condition' do
      let(:cover_state) { 'good' }

      it 'returns false' do
        expect(book.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'when the cover state is in bad condition' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        expect(book.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when the publication date is above 10 years' do
      let(:publish_date) { Date.today - (11 * 365) }

      it 'returns true' do
        expect(book.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when the publication date is below 10 years' do
      let(:publish_date) { Date.today - (9 * 365) }

      it 'returns false' do
        expect(book.send(:can_be_archived?)).to eq(false)
      end
    end
  end
end
