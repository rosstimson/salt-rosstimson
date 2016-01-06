require_relative 'spec_helper'

packages = %w(neovim the_silver_searcher tmux tree)
commands = %w(nvim ag tree)

describe 'tools.packages' do
  packages.each do |name|
    describe package(name) do
      it { should be_installed }
    end
  end

  commands.each do |cmd|
    describe command("#{cmd} --version") do
      its(:exit_status) { should eq 0 }
    end
  end

  describe command("tmux -V") do
    its(:exit_status) { should eq 0 }
  end
end

