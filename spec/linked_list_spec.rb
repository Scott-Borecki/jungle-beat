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
      it 'adds a new piece of data to the end of the list' do
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
        it 'returns two' do
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

    describe '#find' do
      context 'when the list is empty' do
        it 'returns an empty string' do
          expect(list.find(1, 1)).to eq('')
        end
      end

      context 'when the list has less nodes than the given return quantity' do
        it 'returns the nodes through the end of the list' do
          list.append('doop')
          list.append('deep')
          list.append('dip')
          list.append('dink')

          actual = list.find(1, 4)
          expected = 'deep dip dink'
          expect(actual).to eq(expected)

          actual = list.find(3, 4)
          expected = 'dink'
          expect(actual).to eq(expected)
        end
      end

      context 'when the list has more nodes than the given return quantity' do
        it 'returns a string of the elements' do
          list.append('doop')
          list.append('deep')
          list.append('dip')
          list.append('dink')

          actual = list.find(2, 1)
          expected = 'dip'
          expect(actual).to eq(expected)

          actual = list.find(1, 3)
          expected = 'deep dip dink'
          expect(actual).to eq(expected)
        end
      end
    end

    describe '#insert' do
      context 'when the list is empty' do
        it 'adds the node to the list' do
          list.insert(1, 'dink')

          expect(list.head.data).to eq('dink')
          expect(list.head.next_node).to eq(nil)
        end
      end

      context 'when the position is greater than the length of the list' do
        it 'adds the node to the end of the list' do
          list.append('doop')
          list.append('deep')
          list.append('dip')
          list.insert(10, 'dink')

          expect(list.head.data).to eq('doop')
          expect(list.head.next_node).to be_a(Node)
          expect(list.head.next_node.data).to eq('deep')
          expect(list.head.next_node.next_node).to be_a(Node)
          expect(list.head.next_node.next_node.data).to eq('dip')
          expect(list.head.next_node.next_node.next_node).to be_a(Node)
          expect(list.head.next_node.next_node.next_node.data).to eq('dink')
          expect(list.head.next_node.next_node.next_node.next_node).to eq(nil)
        end
      end

      context 'when the list has nodes' do
        it 'inserts the node at a given position in the list' do
          list.append('doop')
          list.append('deep')
          list.append('dip')
          list.insert(1, 'dink')

          expect(list.head.data).to eq('doop')
          expect(list.head.next_node).to be_a(Node)
          expect(list.head.next_node.data).to eq('dink')
          expect(list.head.next_node.next_node).to be_a(Node)
          expect(list.head.next_node.next_node.data).to eq('deep')
          expect(list.head.next_node.next_node.next_node).to be_a(Node)
          expect(list.head.next_node.next_node.next_node.data).to eq('dip')
          expect(list.head.next_node.next_node.next_node.next_node).to eq(nil)
        end
      end

      context 'when the given position is negative'
    end

    describe '#prepend' do
      context 'when the list is empty' do
        it 'adds the node to the list' do
          list.prepend('dip')

          expect(list.head.data).to eq('dip')
          expect(list.head.next_node).to eq(nil)
        end
      end

      context 'when the list has nodes' do
        it 'adds a new piece of data to the beginning of the list' do
          list.append('doop')
          list.append('deep')
          list.prepend('dip')

          expect(list.head.data).to eq('dip')
          expect(list.head.next_node).to be_a(Node)
          expect(list.head.next_node.data).to eq('doop')
          expect(list.head.next_node.next_node).to be_a(Node)
          expect(list.head.next_node.next_node.data).to eq('deep')
          expect(list.head.next_node.next_node.next_node).to eq(nil)
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
