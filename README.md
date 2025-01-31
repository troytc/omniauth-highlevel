# Omniauth::Highlevel

This gem provides an OmniAuth strategy for authenticating with HighLevel (GoHighLevel). It allows you to easily integrate HighLevel OAuth2 authentication into your Ruby applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-highlevel'
```

Then run `bundle install`.

## Usage

To use the HighLevel strategy, you need to configure it in your OmniAuth initializer or application configuration. Here's an example of how to set it up:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :highlevel, ENV['HIGHLEVEL_CLIENT_ID'], ENV['HIGHLEVEL_CLIENT_SECRET']
end
```

### Configuration Options

The strategy comes with the following default options:

- **Site**: https://services.leadconnectorhq.com
- **Authorize URL**: https://marketplace.gohighlevel.com/oauth/chooselocation
- **Token URL**: https://services.leadconnectorhq.com/oauth/token

### Default Scopes

The strategy requests the following scopes by default:

- locations.readonly
- users.readonly
- opportunities.readonly
- opportunities.write
- contacts.readonly
- contacts.write
- calendars.readonly
- calendars.write
- calendars/events.readonly
- calendars/events.write
- workflows.readonly

### Auth Hash

Here's an example of the auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  provider: 'highlevel',
  uid: '123545',
  credentials: {
    token: 'OAUTH-TOKEN',
    refresh_token: 'REFRESH-TOKEN', 
    expires_at: 1354920555,
    expires: true,
    companyId: 'COMPANY-ID'
  },
  info: {
    # Raw user info from HighLevel
  }
}
```

This hash includes the provider, user ID, credentials, and raw user info from HighLevel.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Releasing New Versions

To release a new version:

1. Update the version number in `lib/omniauth-highlevel/version.rb`
2. Update the CHANGELOG.md with your changes under the appropriate version header
3. Commit your changes:
   ```bash
   git add CHANGELOG.md lib/omniauth-highlevel/version.rb
   git commit -m "Bump version to X.Y.Z"
   ```
4. Create and push a new tag:
   ```bash
   git tag -a vX.Y.Z -m "Version X.Y.Z"
   git push origin main --tags
   ```
5. Build and push the gem:
   ```bash
   gem build omniauth-highlevel.gemspec
   gem push omniauth-highlevel-X.Y.Z.gem
   ```

Make sure you have proper credentials set up for RubyGems.org before pushing the gem.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/troytc/omniauth-highlevel.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
