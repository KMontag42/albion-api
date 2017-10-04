module AlbionApi
  # this class wraps the /deaths API request
  class Deaths < AlbionRequest
    def initialize(character_api_id)
      @character_api_id = character_api_id
    end

    def perform
      response = self.class.get("/players/#{@character_api_id}/deaths")
      Response.new(response)
    end

    private

    attr_accessor :character_api_id

    class Response
      def initialize(response)
        @_deaths = JSON.parse(response.body)
      end

      def deaths
        @_deaths
      end

      private

      attr_accessor :_deaths
    end
  end
end
