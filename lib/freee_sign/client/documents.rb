# frozen_string_literal: true

module FreeeSign
  class Client
    module Documents
      def documents(params = {})
        get('/v1/documents', params)
      end

      def document(id)
        get("/v1/documents/#{id}")
      end

      def create_document
        post('/v1/documents')
      end

      def contract_certificate(document_id)
        get("/v1/documents/#{document_id}/contract_certificate")
      end

      def meta_items(document_id, payload:)
        put("/v1/documents/#{document_id}/meta", payload: payload)
      end
    end
  end
end
