require 'spec_helper'

describe 'jenkins-configuration::config' do
  let(:chef_run) do
    runner = ChefSpec::ChefRunner.new()
    runner.converge('jenkins-configuration::config')
  end

  it 'installs update-notifier-common' do
    expect(chef_run).to install_package 'update-notifier-common'
  end

  it 'apt-get updates' do
    expect(chef_run).to execute_command 'apt-get update'
  end

  it 'creates preseeding directory' do
    expect(chef_run).to create_directory('/var/cache/local')
    expect(chef_run).to create_directory('/var/cache/local/preseeding')
  end

end
