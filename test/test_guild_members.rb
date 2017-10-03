require 'test_helper.rb'

describe AlbionApi::GuildMembers do
  before do
    @client = AlbionApi::GuildMembers.new('z-wCJdjQT2u16bH8lfcqjA')
  end

  describe 'find' do
    before do
      @response = @client.find
    end

    it 'returns an instance of the response class' do
      @response.class.must_equal AlbionApi::GuildMembers::Response
    end

    describe 'response' do
      it 'has an array of members' do
        @response.members.class.must_equal Array
      end

      it 'has an array of members that is not empty' do
        (@response.members.length > 0).must_equal true
      end
    end
  end
end
