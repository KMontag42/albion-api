require 'test_helper.rb'

describe AlbionApi::Entity::Helper do
  describe 'create_item' do
    subject { AlbionApi::Entity::Helper.create_item(@item_raw) }

    describe 'when item_raw is not nil' do
      before do
        @item_raw = JSON.parse(File.read('test/fixtures/entities/item.json'))
      end

      it 'returns an instance of the Item Entity' do
        subject.class.must_equal AlbionApi::Entity::Item
      end

      it 'has the correct ActiveSpells list' do
        subject.active_spells.must_equal []
      end

      it 'has the correct count' do
        subject.count.must_equal 1
      end

      it 'has the correct PassiveSpells list' do
        subject.passive_spells.must_equal ['COOL_SPELL']
      end

      it 'has the correct quality' do
        subject.quality.must_equal 1
      end

      it 'has the correct type' do
        subject.type.must_equal 'COOL_TYPE'
      end
    end

    describe 'when item_raw is nil' do
      before do
        @item_raw = nil
      end

      it 'returns nil' do
        subject.must_equal nil
      end
    end
  end

  describe 'create_inventory' do
    subject { AlbionApi::Entity::Helper.create_inventory(@inventory_raw) }

    describe 'when inventory_raw is has non-nil items' do
      before do
        @inventory_raw = JSON.parse(File.read('test/fixtures/entities/inventory_with_items.json'))
      end

      it 'returns an array' do
        subject.class.must_equal Array
      end

      it 'returns an array with an Item in it' do
        subject.any? { |x| x.class == AlbionApi::Entity::Item }.must_equal(true)
      end

      it 'returns an array with the correct length' do
        subject.length.must_equal @inventory_raw.length
      end
    end

    describe 'when inventory_raw is only null values' do
      before do
        @inventory_raw = JSON.parse(File.read('test/fixtures/entities/empty_inventory.json'))
      end

      it 'returns an array' do
        subject.class.must_equal Array
      end

      it 'returns an array of only nil values' do
        subject.all?(&:nil?).must_equal true
      end
    end
  end
end
