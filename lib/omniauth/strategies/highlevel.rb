# frozen_string_literal: true

module OmniAuth
  module Strategies
    class Highlevel < OmniAuth::Strategies::OAuth2
      option :name, "highlevel"

      option :client_options, {
        site: "https://services.leadconnectorhq.com",
        authorize_url: "https://marketplace.gohighlevel.com/oauth/chooselocation",
        token_url: "https://services.leadconnectorhq.com/oauth/token"
      }

      option :authorize_params, {
        scope: "locations.readonly users.readonly opportunities.readonly opportunities.write contacts.readonly contacts.write calendars.readonly calendars.write calendars/events.readonly calendars/events.write workflows.readonly"
      }

      option :token_options, {
        method: :post
      }

      option :token_params, {
        user_type: "Location"
      }

      uid { access_token.params["locationId"] }

      def token_params
        super.merge({
          client_id: client.id,
          client_secret: client.secret
        })
      end
    end
  end
end
