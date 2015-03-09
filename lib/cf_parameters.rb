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
          realValue = if value.start_with?("$") then ENV[value[1..-1]] else value end
          new_parameter = {"ParameterKey" => key, "ParameterValue" => realValue}
          cf_parameters.push(new_parameter)
      end
      JSON.pretty_generate(cf_parameters)
    end
  end
end
