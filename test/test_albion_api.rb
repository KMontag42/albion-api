require 'test_helper.rb'

describe AlbionApi do
  describe 'self.base_api_url' do
    it 'returns the correct value' do
      AlbionApi.base_api_url.must_equal 'https://gameinfo.albiononline.com/api/gameinfo'
    end
  end
end
