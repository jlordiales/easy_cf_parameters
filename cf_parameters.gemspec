# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cf_parameters/version'

Gem::Specification.new do |spec|
  spec.name          = "cf_parameters"
  spec.version       = CfParameters::VERSION
  spec.authors       = ["Jose Luis Ordiales Coscia"]
  spec.email         = ["jlordiales@gmail.com"]

  spec.summary       = %q{Convert YAML to the JSON File format expected by CloudFormation}
  spec.description   = %q{CloudFormation JSON files to specify input parameters are cumbersome
  to write. They also don't provide any easy way to specify values from enviroment variables.
  This small script allows you to specify key/value pairs in YAML format with the added
  capability of resolving those values from enviroment variables. You can write the output to a 
  file and pass that to CloudFormation together with your template.}
  spec.homepage      = "https://github.com/jlordiales/easy_cf_parameters.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = "cf_parameters"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
