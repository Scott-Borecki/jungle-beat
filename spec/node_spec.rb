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
end
