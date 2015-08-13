module Persistiq
  class Client
    module Lead

      def list_leads(paginate = true)
        get(lead_path)
      end

      def create_lead(options={})
        post(lead_path, options)
      end

      def get_lead(id, options={})
        get(lead_path(id), options)
      end

      private

      def lead_path(id=nil)
        id ? "leads/#{id}/" : "leads"
      end

    end
  end
end
