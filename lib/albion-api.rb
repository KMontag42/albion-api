require 'httparty'

BASE_API_URL = "https://gameinfo.albiononline.com/api/gameinfo".freeze

# this module contains all of the classes needed to make requests to the Albion Online API
module AlbionApi
  class AlbionRequest
    include HTTParty
    base_uri BASE_API_URL
  end

  def self.base_api_url
    BASE_API_URL
  end
end

# require our API Entities for use in our Request classes
require 'albion-api/entities.rb'

# require our Entity Helper
require 'albion-api/helpers/entity_helper.rb'

# require all of our classes that belong to this module
require 'albion-api/user_killboard.rb'
require 'albion-api/user_search.rb'
require 'albion-api/guild_search.rb'
require 'albion-api/guild_members.rb'
require 'albion-api/weapon_categories.rb'
require 'albion-api/deaths.rb'
