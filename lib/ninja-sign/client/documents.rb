# frozen_string_literal: true

module NinjaSign
  class Client
    module Documents
      def documents
        get("/v1/documents")
      end

      def document(id)
        get("/v1/documents/#{id}")
      end
    end
  end
end
