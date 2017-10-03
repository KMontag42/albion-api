module AlbionApi
  # this is the class used to search for users, namely to get their API ID
  class UserSearch < AlbionRequest
    def initialize(character_name)
      @character_name = character_name
    end

    def find
      response = self.class.get("/search?q=#{character_name}")
      Response.new(response)
    end

    private

    attr_accessor :character_name

    # this class wraps the response from the API
    class Response
      def initialize(response)
        player = response['players'][0]
        @_api_id = player['Id']
        @_guild_api_id = player['GuildId']
        @_guild_name = player['GuildName']
      end

      def api_id
        @_api_id
      end

      def guild_api_id
        @_guild_api_id
      end

      def guild_name
        @_guild_name
      end

      private

      attr_accessor :_api_id, :_guild_api_id, :_guild_name
    end
  end
end
