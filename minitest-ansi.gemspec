# encoding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/ansi/version'

Gem::Specification.new do |gem|
  gem.name          = 'minitest-ansi'
  gem.version       = MiniTest::AnsiVersion::VERSION
  gem.authors       = ['Zeh Rizzatti']
  gem.email         = ['zehrizzatti@gmail.com']
  gem.description   = %q{Colorizes minitest output with ANSI codes}
  gem.summary       = %q{Colors for minitest output}
  gem.homepage      = 'https://github.com/zehrizzatti/minitest-ansi'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.add_runtime_dependency 'ansi', '~> 1.4.0'
  gem.add_runtime_dependency 'minitest', '~> 4.3.0'
  gem.add_development_dependency 'rake'
end
