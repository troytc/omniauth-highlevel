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

      uid { raw_info['user_id'] }

      credentials do
        hash = { 'token' => access_token.token }
        hash['refresh_token'] = access_token.refresh_token if access_token.expires? && access_token.refresh_token
        hash['expires_at'] = access_token.expires_at if access_token.expires?
        hash['expires'] = access_token.expires?
        hash['companyId'] = raw_info['companyId']
        hash
      end

      info do
        info = raw_info || {}
        info = deep_symbolize(info)
        info
      end

      def raw_info
        @raw_info ||= access_token.params
      end

      def token_params
        super.merge(
          {
            client_id: client.id,
            client_secret: client.secret
          }
        )
      end
    end
  end
end
