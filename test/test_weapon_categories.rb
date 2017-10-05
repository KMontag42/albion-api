require 'test_helper.rb'

describe AlbionApi::WeaponCategories do
  before do
    @client = AlbionApi::WeaponCategories.new
    @api_response = JSON.parse(File.read('./test/fixtures/responses/weapon_categories.json'))
  end

  describe 'perform' do
    subject { @client.perform }

    it 'returns an instance of the response class' do
      subject.class.must_equal AlbionApi::WeaponCategories::Response
    end

    describe 'response' do
      it 'contains a list of weapon categories' do
        subject.categories.class.must_equal Array
      end

      it 'contains a list of WeaponCategory instances' do
        subject.categories.first.class.must_equal AlbionApi::Entity::WeaponCategory
      end

      it 'contains a list of all the current weapon categories' do
        subject.categories.collect(&:name).must_equal(@api_response.collect { |item| item['name'] })
      end
    end
  end
end
