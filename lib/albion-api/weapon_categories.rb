module AlbionApi
  # this class is for the `_weaponCategories` API call
  class WeaponCategories < AlbionRequest
    def perform
      response = self.class.get('/items/_weaponCategories')
      Response.new(response)
    end

    # the response class that contains all the needed info
    class Response
      def initialize(response)
        @_categories = response.map do |item|
          WeaponCategory.new(item['id'], item['name'])
        end
      end

      def categories
        @_categories
      end

      private

      attr_accessor :_categories

      WeaponCategory = Struct.new(:id, :name)
    end
  end
end
