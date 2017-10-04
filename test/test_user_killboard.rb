require 'test_helper.rb'

describe AlbionApi::UserKillboard do
  before do
    @client = AlbionApi::UserKillboard.new('3MbmlPMqTRCtX4ncMMhx0w')
  end

  describe 'top_kills_in_range' do
    it 'returns an instance of the response class' do
      two_days_ago = Time.now - (2 * 60 * 60 * 24)
      @client.top_kills_in_range(two_days_ago, Time.now)
             .class.must_equal AlbionApi::UserKillboard::Response
    end
  end
end
