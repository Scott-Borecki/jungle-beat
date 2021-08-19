require_relative 'spec_helper'

RSpec.describe LinkedList do
  describe 'object creation' do
    let(:list) { LinkedList.new }

    it 'exists' do
      expect(list).to be_a(LinkedList)
    end

    it 'has readable attributes' do
      expect(list.head).to eq(nil)
    end
  end

  describe 'instance methods' do
    let(:list) { LinkedList.new }

    describe '#append' do
      it 'adds a new piece of data to the list' do
        list.append('doop')

        expect(list.head.data).to eq('doop')
        expect(list.head.next_node).to eq(nil)
      end
    end

    describe '#count' do
      it 'tells us how many things are in the list' do
        list.append('doop')

        expect(list.count).to eq(1)
      end
    end

    describe '#to_string' do
      it 'generates a string of all the elements in the list, separated by spaces' do
        list.append('doop')

        expect(list.to_string).to eq('doop')
      end
    end
  end
end
