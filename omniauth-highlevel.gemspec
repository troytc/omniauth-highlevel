Gem::Specification.new do |spec|
  spec.name          = 'omniauth-highlevel'
  spec.version       = '0.1.0'
  spec.authors       = [ 'Troy Clark' ]
  spec.email         = [ 'troy@troytc.com' ]
  spec.homepage      = 'https://github.com/troytc/omniauth-highlevel'
  spec.summary       = 'OmniAuth strategy for HighLevel'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end

  spec.add_runtime_dependency 'omniauth', '~> 2.0'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.8'
end
