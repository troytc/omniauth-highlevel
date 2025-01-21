# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Highlevel < OmniAuth::Strategies::OAuth2
      option :name, 'highlevel'
      option :user_type, 'Company'

      option :client_options, {
        site: 'https://services.leadconnectorhq.com',
        authorize_url: 'https://marketplace.gohighlevel.com/oauth/chooselocation',
        token_url: 'https://services.leadconnectorhq.com/oauth/token'
      }

      option :authorize_params, {
        scope: 'locations.readonly users.readonly opportunities.readonly opportunities.write contacts.readonly contacts.write calendars.readonly calendars.write calendars/events.readonly calendars/events.write workflows.readonly'
      }

      option :token_options, {
        method: :post
      }

      option :token_params, {
        user_type: options.user_type,
        client_id: client.id,
        client_secret: client.secret
      }

      uid { access_token.params['locationId'] }

      def raw_info
        @raw_info ||= access_token.get('/api/v1/locations/me').parsed
      end
    end
  end
end
