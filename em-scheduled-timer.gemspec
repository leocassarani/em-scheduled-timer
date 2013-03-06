# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'em-scheduled-timer/version'

Gem::Specification.new do |spec|
  spec.name          = "em-scheduled-timer"
  spec.version       = EventMachine::ScheduledTimer::VERSION
  spec.authors       = ["Leo Cassarani"]
  spec.email         = ["leo.cassarani@me.com"]
  spec.description   = %q{EM::ScheduledTimer provides EventMachine timers that let you specify a time, rather than an interval, at which to fire.}
  spec.summary       = %q{EventMachine timers that fire at a given time in the future}
  spec.homepage      = "https://github.com/leocassarani/em-scheduled-timer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "eventmachine", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
