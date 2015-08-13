module Persistiq
  class Client
    module Campaign

      def list_campaigns(paginate = true)
        get(campaign_path)
      end

      def add_leads_to_campaign(id, options={})
        post(campaign_path(id), options)
      end

      private

      def campaign_path(id=nil)
        id ? "campaigns/#{id}/leads" : "campaigns"
      end

    end
  end
end

# def list_leads(query = {}, paginate = false, fields = nil, options = {})
#   options[:_fields] = fields if fields
#   params = assemble_list_query query, options
# 
#   if paginate
#     paginate(lead_path, params)
#   else
#     get(lead_path, params)
#   end
# end