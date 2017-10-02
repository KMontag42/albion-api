require 'test_helper'

describe AlbionApi::UserSearch do
  before do
    @client = AlbionApi::UserSearch.new('TKM420')
  end

  describe 'find' do
    it 'returns an instance of the response class' do
      @client.find.class.must_equal AlbionApi::UserSearch::Response
    end

    describe 'response' do
      before do
        @response = @client.find
      end

      it 'has the correct API Id' do
        @response.api_id.must_equal '3MbmlPMqTRCtX4ncMMhx0w'
      end

      it 'has the correct Guild API Id' do
        @response.guild_api_id.must_equal 'z-wCJdjQT2u16bH8lfcqjA'
      end
    end
  end
end
