# frozen_string_literal: true

module NinjaSign
  class Client
    module Documents
      def documents(params = {})
        get("/v1/documents", params)
      end

      def document(id)
        get("/v1/documents/#{id}")
      end
    end
  end
end
