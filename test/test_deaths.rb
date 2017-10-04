require 'test_helper.rb'

describe AlbionApi::Deaths do
  before do
    @client = AlbionApi::Deaths.new('3MbmlPMqTRCtX4ncMMhx0w')
  end

  describe 'perform' do
    subject { @client.perform }
    it 'returns an instance of the response class' do
      subject.class.must_equal AlbionApi::Deaths::Response
    end

    describe 'response.deaths' do
      subject { @client.perform.deaths }

      it 'is an array' do
        subject.class.must_equal Array
      end
    end
  end
end
