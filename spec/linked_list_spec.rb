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

        expect(list.head).to be_a(Node)
        expect(list.head.data).to eq('doop')
        expect(list.head.next_node).to eq(nil)

        list.append('deep')

        expect(list.head.data).to eq('doop')
        expect(list.head.next_node).to be_a(Node)
        expect(list.head.next_node.data).to eq('deep')
        expect(list.head.next_node.next_node).to eq(nil)

        list.append('dip')

        expect(list.head.data).to eq('doop')
        expect(list.head.next_node).to be_a(Node)
        expect(list.head.next_node.data).to eq('deep')
        expect(list.head.next_node.next_node).to be_a(Node)
        expect(list.head.next_node.next_node.data).to eq('dip')
        expect(list.head.next_node.next_node.next_node).to eq(nil)
      end
    end

    describe '#count' do
      context 'when the list is empty' do
        it 'returns zero' do
          expect(list.count).to eq(0)
        end
      end

      context 'when there is one node in the list' do
        it 'returns one' do
          list.append('doop')

          expect(list.count).to eq(1)
        end
      end

      context 'when there are two nodes in the list' do
        it 'returns the number of nodes in the list' do
          list.append('doop')
          list.append('deep')

          expect(list.count).to eq(2)
        end
      end

      context 'when there are more than two nodes in the list' do
        it 'returns the number of nodes in the list' do
          list.append('doop')
          list.append('deep')
          list.append('dip')

          expect(list.count).to eq(3)
        end
      end
    end

    describe '#to_string' do
      context 'when the list is empty' do
        it 'returns an empty string' do
          expect(list.to_string).to eq('')
        end
      end

      context 'when there is one node in the list' do
        it 'returns a string with the node' do
          list.append('doop')

          expect(list.to_string).to eq('doop')
        end
      end

      context 'when there are two nodes in the list' do
        it 'returns a string with the two nodes separated by a space' do
          list.append('doop')
          list.append('deep')

          expect(list.to_string).to eq('doop deep')
        end
      end

      context 'when there are more than two nodes in the list' do
        it 'returns a string with the each node separated by a space' do
          list.append('doop')
          list.append('deep')
          list.append('dip')

          expect(list.to_string).to eq('doop deep dip')
        end
      end
    end
  end
end
