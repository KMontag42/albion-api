module AlbionApi
  # the class for getting the members of a Guild
  class GuildMembers < AlbionRequest
    def initialize(guild_api_id)
      @guild_api_id = guild_api_id
    end

    def find
      response = self.class.get("/guilds/#{@guild_api_id}/members")
      Response.new(response)
    end

    private

    attr_accessor :guild_api_id

    # the response class
    class Response
      def initialize(response)
        @_members = JSON.parse(response.body)
      end

      def members
        @_members
      end

      private

      attr_accessor :_members
    end
  end
end
