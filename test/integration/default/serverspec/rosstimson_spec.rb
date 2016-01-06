require_relative 'spec_helper'

describe 'rosstimson.user' do
  describe user('rosstimson') do
    it { should exist }
    it { should belong_to_group 'wheel' }
    it { should have_uid 1337 }
    it { should have_home_directory '/home/rosstimson' }
    it { should have_login_shell '/usr/local/bin/zsh' }
  end
end

describe 'rosstimson.dirs' do
  describe file('/home/rosstimson/code') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  describe file('/home/rosstimson/code/go') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  describe file('/home/rosstimson/code/python') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  describe file('/home/rosstimson/code/c') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  describe file('/home/rosstimson/devops') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  describe file('/home/rosstimson/pictures') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  describe file('/home/rosstimson/pictures/wallpapers') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  describe file('/home/rosstimson/music') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end
end

describe 'rosstimson.dotfiles' do
  describe file('/home/rosstimson/code/dotfiles') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'rosstimson' }
    it { should be_grouped_into 'rosstimson' }
  end

  # Just test a few random dotfiles to make sure the 'make install' has copied
  # my dotfiles into place.
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
