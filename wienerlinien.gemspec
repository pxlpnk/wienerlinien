require File.expand_path('../lib/wienerlinien/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = 'Andreas Tiefenthaler'
  gem.email = %w(at@an-ti.eu)
  gem.description = %q{Wrapper for the Wiener Linien}
  gem.summary = %q{Wrapper for the Wiener Linien}
  gem.homepage = 'https://github.com/pxlpnk/wiener_linien'
  gem.files = `git ls-files`.split($\)
  gem.name = 'wienerlinien'
  gem.require_paths = ['lib']
  gem.version = Wienerlinien::VERSION

  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'recursive-open-struct'
end
