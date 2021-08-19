require_relative 'spec_helper'

RSpec.describe Node do
  describe 'object creation' do
    let(:node) { Node.new('plop') }

    it 'exists' do
      expect(node).to be_a(Node)
    end

    it 'has readable attributes' do
      expect(node.data).to eq('plop')
      expect(node.next_node).to eq(nil)
    end
  end

  describe 'instance methods' do
    let(:node) { Node.new('plop') }

    describe '#add_next_node' do
      it 'creates a new node as the next node' do
        node.add_next_node('drop')

        expect(node.next_node).to be_a(Node)
        expect(node.next_node.data).to eq('drop')
        expect(node.next_node.next_node).to eq(nil)

        node.add_next_node('drip')

        expect(node.next_node).to be_a(Node)
        expect(node.next_node.data).to eq('drop')
        expect(node.next_node.next_node).to be_a(Node)
        expect(node.next_node.next_node.data).to eq('drip')
        expect(node.next_node.next_node.next_node).to eq(nil)
      end
    end
  end
end
