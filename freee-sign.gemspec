# frozen_string_literal: true

require_relative 'lib/freee_sign/version'

Gem::Specification.new do |spec|
  spec.name = 'freee-sign-ruby'
  spec.version = FreeeSign::VERSION
  spec.authors = ['yokozawa0701']
  spec.email = ['d.yoko.0701@gmail.com']

  spec.summary = 'freeeサインのAPIをRubyで簡単に叩くためのGem'
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = 'https://github.com/yokozawa0701/freee-sign-ruby'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://github.com/yokozawa0701/freee-sign-ruby'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/yokozawa0701/freee-sign-ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/yokozawa0701/freee-sign-ruby/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 2.2.0'
end
