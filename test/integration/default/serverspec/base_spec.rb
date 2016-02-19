require_relative 'spec_helper'

packages = %w(bash curl git gmake sudo wget zsh)

describe 'base.packages' do
  packages.each do |name|
    describe package(name) do
      it { should be_installed }
    end

    describe command("#{name} --version") do
      its(:exit_status) { should eq 0 }
    end

    # Subversion command is different to package name
    describe package('subversion') do
      it { should be_installed }
    end

    describe command('svn --version') do
      its(:exit_status) { should eq 0 }
    end
  end
end

describe 'base.sudo' do
  describe file('/usr/local/etc/sudoers') do
    its(:content) { should match /^%wheel ALL=\(ALL\) NOPASSWD: ALL$/ }
  end
end
