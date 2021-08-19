require_relative 'spec_helper'

RSpec.describe LinkedList do
  describe 'object creation' do
    let(:jb) { JungleBeat.new }

    it 'exists' do
      expect(jb).to be_a(JungleBeat)
    end

    it 'has readable attributes' do
      expect(jb.list).to be_a(LinkedList)
      expect(jb.list.head).to eq(nil)
    end
  end

  describe 'instance methods' do
    let(:jb) { JungleBeat.new }

    describe '#append' do
      it 'adds nodes to the list' do
        actual = jb.append('deep doo ditt')
        expected = 'deep doo ditt'
        expect(actual).to eq(expected)
        expect(jb.list.head.data).to eq('deep')
        expect(jb.list.head.next_node.data).to eq('doo')

        actual = jb.append('woo hoo shu')
        expected = 'woo hoo shu'
        expect(actual).to eq(expected)
        expect(jb.list.count).to eq(6)
        expect(jb.count).to eq(6)
      end
    end

    describe '#count' do
      context 'when the list is empty' do
        it 'returns zero' do
          expect(jb.count).to eq(0)
        end
      end

      context 'when the list is not empty' do
        it 'counts the number of nodes in the list' do
          jb.append('deep doo ditt')
          expect(jb.count).to eq(3)

          jb.append('woo hoo shu')
          expect(jb.count).to eq(6)
        end
      end
    end
  end
end
