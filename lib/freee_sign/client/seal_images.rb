module FreeeSign
  class Client
    module SealImages
      def seal_images(params = {})
        get('/v1/seal_images', params)
      end
    end
  end
end
