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

    # the response class for the Deaths API
    class Response
      def initialize(response)
        raw_data = JSON.parse(response.body)
        @_deaths = raw_data.map do |raw|
          AlbionApi::Entity::Helper.create_death(raw)
        end
      end

      def deaths
        @_deaths
      end

      private

      attr_accessor :_deaths
    end
  end
end
