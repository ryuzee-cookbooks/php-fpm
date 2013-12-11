require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
  end
  c.path = "/sbin:/usr/sbin"
end

describe package("php-fpm") do
  it { should be_installed }
end

describe service("php-fpm") do
  it { should be_enabled }
  it { should be_running }
end

