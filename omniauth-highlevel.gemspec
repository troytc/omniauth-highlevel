require './lib/omniauth-highlevel/version'

Gem::Specification.new do |spec|
  spec.name         = 'omniauth-highlevel'
  spec.version      = Omniauth::Highlevel::VERSION
  spec.authors      = ['Troy Clark']
  spec.email        = ['troy@troytc.com']
  spec.homepage     = 'https://github.com/troytc/omniauth-highlevel'
  spec.summary      = 'OmniAuth strategy for HighLevel'
  spec.license      = 'MIT'

  spec.files          = `git ls-files -- lib/*`.split("\n")
  spec.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths  = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.8'
end
