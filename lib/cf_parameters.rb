require "cf_parameters/version"
require "yaml"
require "json"

module CfParameters
  class CFParameterGenerator
    def get_cf_parameters(yamlInput)
      yaml_parameters = YAML.load_file(yamlInput)
      cf_parameters = []

      yaml_parameters.each do |key, value|
          value ||= ""
          realValue = if !value.start_with?("$") then value else ENV[value[1..-1]] end || ""
          cf_parameters << {"ParameterKey" => key, "ParameterValue" => realValue}
      end
      JSON.pretty_generate(cf_parameters)
    end
  end
end
