require 'test_helper.rb'

describe AlbionApi::UserKillboard do
  before do
    @client = AlbionApi::UserKillboard.new('TKM420')
  end

  describe 'top_kills_in_range' do
    it 'returns an instance of the response class' do
      @client.top_kills_in_range(Time.now-2.day, Time.now)
             .class.must_equal AlbionApi::UserKillboard::Response
    end
  end
end
