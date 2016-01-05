require_relative 'spec_helper'

# Git
# -----------------------------------------------------------------------------
describe package('git') do
  it { should be_installed }
end

describe command('git --version') do
  its(:exit_status) { should eq 0 }
end


# ZSH
# -----------------------------------------------------------------------------
describe package('zsh') do
  it { should be_installed }
end

describe command('zsh --version') do
  its(:exit_status) { should eq 0 }
end


# Curl
# -----------------------------------------------------------------------------
describe package('curl') do
  it { should be_installed }
end

describe command('curl --version') do
  its(:exit_status) { should eq 0 }
end


# Wget
# -----------------------------------------------------------------------------
describe package('wget') do
  it { should be_installed }
end

describe command('wget --version') do
  its(:exit_status) { should eq 0 }
end
