require 'test_helper.rb'

describe AlbionApi::GuildSearch do
  before do
    @client = AlbionApi::GuildSearch.new('glorious nomads')
  end

  describe 'find' do
    it 'returns an instance of the response class' do
      @client.find.class.must_equal AlbionApi::GuildSearch::Response
    end

    describe 'response' do
      before do
        @response = @client.find
      end

      it 'has the correct guild API Id' do
        @response.guild_api_id.must_equal 'z-wCJdjQT2u16bH8lfcqjA'
      end

      it 'has the correct alliance name' do
        @response.alliance_name.must_equal 'Blood'
      end

      it 'has the correct alliance API Id' do
        @response.alliance_api_id.must_equal 'p7tzXO_0RmaDluF5nztlDw'
      end
    end
  end
end
