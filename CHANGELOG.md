## [0.1.1] - 2025-01-31

### Changed
- Enhanced OAuth token handling:
  - Added comprehensive credentials hash including token, refresh_token, expires_at, and companyId
  - Improved raw_info method to better handle access_token parameters
  - Added deep symbolization of user information
- Improved configuration flexibility:
  - Made user_type configurable (defaults to 'Company')
  - Simplified token parameter generation
  - Restructured authorization flow for better integration
- Code quality improvements:
  - Standardized string literals
  - Enhanced code organization and readability

## [0.1.0] - 2024-12-05

### Added
- Initial OAuth2 strategy implementation:
  - Basic authentication flow with HighLevel API
  - Support for multiple OAuth scopes including:
    - locations.readonly
    - users.readonly
    - opportunities.readonly/write
    - contacts.readonly/write
    - calendars.readonly/write
    - calendars/events.readonly/write
    - workflows.readonly
- Project infrastructure:
  - GitHub Actions workflow setup
  - Standard Ruby project structure
  - Gemfile and dependency management
  - Rake tasks for development
  - Initial documentation
