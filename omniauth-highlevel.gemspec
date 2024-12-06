Gem::Specification.new do |spec|
  spec.name          = 'omniauth-highlevel'
  spec.version       = '0.1'
  spec.authors       = [ 'Troy Clark' ]
  spec.email         = [ 'troy@troytc.com' ]
  spec.homepage      = 'https://github.com/troytc/omniauth-highlevel'
  spec.summary       = 'OmniAuth strategy for HighLevel'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']

  spec.add_runtime_dependency 'omniauth', '~> 2.0'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.8'
end
