[![Gem Version](https://badge.fury.io/rb/cf_parameters.svg)](http://badge.fury.io/rb/cf_parameters)
[![Build Status](https://travis-ci.org/jlordiales/easy_cf_parameters.svg?branch=master)](https://travis-ci.org/jlordiales/easy_cf_parameters)

# CfParameters

CloudFormation JSON files to specify input parameters are cumbersome to
[write](http://blogs.aws.amazon.com/application-management/post/Tx1A23GYVMVFKFD/Passing-Parameters-to-CloudFormation-Stacks-with-the-AWS-CLI-and-Powershell).
They also don't provide any easy way to specify values from environment
variables. This small script allows you to specify key/value pairs in YAML
format with the added capability of resolving those values from environment
variables if the value starts with $.  You can write the output to a file and
pass that to CloudFormation together with your template.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cf_parameters'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cf_parameters

## Usage
```bash
cat some.yml

key1: value1
key2: $SOME_ENV_VAR

export SOME_ENV_VAR=5

cf_parameters some.yml

[
  {
    "ParameterKey": "key1",
    "ParamterValue": "value1"
  },
  {
    "ParameterKey": "key2",
    "ParamterValue": "5"
  }
]

```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/easy_cf_parameters/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
