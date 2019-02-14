#
# Cookbook Name:: nginx-cookbook
# Spec:: default
#
# Copyright (c) 2019 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'nginx-cookbook::default' do
  context 'On Ubuntu 18.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: 18.04)
      runner.converge(described_recipe)
    end

    it 'successfully installs nginx' do
      expect(chef_run).to install_package('nginx')
    end

    it 'successfully starts service' do 
      expect(chef_run).to start_service('nginx')
    end

    it 'creates a template that overwrites index.html default file' do
      expect(chef_run).to create_template('index.html').with(
        path: '/var/www/html/index.html',
        source: 'index.html.erb'
      )
    end
  end
end
