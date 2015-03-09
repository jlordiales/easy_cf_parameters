require 'spec_helper'

describe CfParameters do
  let(:generator) {CfParameters::CFParameterGenerator.new}

  it 'has a version number' do
    expect(CfParameters::VERSION).not_to be nil
  end

  it 'parses a well formed yaml file' do
    yaml_text = <<-EOF
      key1: value1
      key2: value2
    EOF
    
    expected_json = [
      {"ParameterKey" => "key1", "ParameterValue" => "value1"},
      {"ParameterKey" => "key2", "ParameterValue" => "value2"}
    ]

    allow(YAML).to receive(:load_file).with("test.yml") {YAML.load(yaml_text)}

    cf_json = JSON.parse(generator.get_cf_parameters("test.yml"))

    expect(cf_json).to eq(expected_json)
  end

  it 'reads a value from the environment' do
    yaml_text = "key1: $SOME_VAR"

    expected_json = [{"ParameterKey" => "key1", "ParameterValue" => "some_value"}]

    allow(YAML).to receive(:load_file).with("test.yml") {YAML.load(yaml_text)}
    allow(ENV).to receive(:[]).with("SOME_VAR") {"some_value"}

    cf_json = JSON.parse(generator.get_cf_parameters("test.yml"))

    expect(cf_json).to eq(expected_json)
  end

  it 'ignores empty lines' do
    yaml_text = <<-EOF
      key1: value1

      key2: value2
    EOF
    
    expected_json = [
      {"ParameterKey" => "key1", "ParameterValue" => "value1"},
      {"ParameterKey" => "key2", "ParameterValue" => "value2"}
    ]

    allow(YAML).to receive(:load_file).with("test.yml") {YAML.load(yaml_text)}

    cf_json = JSON.parse(generator.get_cf_parameters("test.yml"))

    expect(cf_json).to eq(expected_json)
  end

  it 'outputs an empty value if not present in the YAML input' do
    yaml_text = "key1:"

    expected_json = [{"ParameterKey" => "key1", "ParameterValue" => ""}]

    allow(YAML).to receive(:load_file).with("test.yml") {YAML.load(yaml_text)}

    cf_json = JSON.parse(generator.get_cf_parameters("test.yml"))

    expect(cf_json).to eq(expected_json)
  end
end
