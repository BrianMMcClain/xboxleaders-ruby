# -*- encoding: utf-8 -*-
require File.expand_path('../lib/xboxleaders/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Brian McClain"]
  gem.email         = ["brianmmcclain@gmail.com"]
  gem.description   = %q{XboxLeaders Ruby API Wrapper}
  gem.summary       = gem.summary
  gem.homepage      = "https://github.com/BrianMMcClain/xboxleaders-ruby"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "xboxleaders-ruby"
  gem.require_paths = ["lib"]
  gem.version       = XboxLeaders::VERSION
end