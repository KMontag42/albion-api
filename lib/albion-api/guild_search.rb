module AlbionApi
  # this class is used to look up information about a guild
  class GuildSearch < AlbionRequest
    def initialize(guild_name)
      @guild_name = guild_name
    end

    def find
      response = self.class.get("/search?q=#{guild_name}")
      Response.new(response)
    end

    private

    attr_accessor :guild_name

    # the response class for the GuildSearch request
    class Response
      def initialize(response)
        guild_info = response['guilds'][0]
        @_guild_api_id = guild_info['Id']
        @_alliance_name = guild_info['AllianceName']
        @_alliance_api_id = guild_info['AllianceId']
      end

      def guild_api_id
        @_guild_api_id
      end

      def alliance_name
        @_alliance_name
      end

      def alliance_api_id
        @_alliance_api_id
      end

      private

      attr_accessor :_guild_api_id, :_alliance_name, :_alliance_api_id
    end
  end
end
