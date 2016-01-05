require_relative 'spec_helper'

describe 'my user setup' do
  describe user('rosstimson') do
    it { should exist }
    it { should belong_to_group 'wheel' }
    it { should have_uid 1337 }
    it { should have_home_directory '/home/rosstimson' }
    it { should have_login_shell '/usr/local/bin/zsh' }
  end

  describe file('/home/rosstimson/code') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  describe file('/home/rosstimson/code/dotfiles') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  # Just test a few random dotfiles to make sure the 'make install' has copied
  # my dotfiles into place.
  describe 'dotfiles' do
    describe file('/home/rosstimson/.zshrc') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'rosstimson' }
      it { should be_grouped_into 'rosstimson' }
    end

    describe file('/home/rosstimson/.vim') do
      it { should be_directory }
      it { should be_mode 755 }
      it { should be_owned_by 'rosstimson' }
      it { should be_grouped_into 'rosstimson' }
    end
  end
end
