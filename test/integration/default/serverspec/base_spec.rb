require_relative 'spec_helper'

packages = %w(bash curl git gmake gnuls wget zsh)

describe 'base.packages' do
  packages.each do |name|
    describe package(name) do
      it { should be_installed }
    end

    describe command("#{name} --version") do
      its(:exit_status) { should eq 0 }
    end
  end
end
