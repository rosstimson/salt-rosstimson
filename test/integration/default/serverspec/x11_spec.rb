require_relative 'spec_helper'

packages = %w(dmenu feh rxvt-unicode xautolock xlockmore xorg)

describe 'x11.packages' do
  packages.each do |name|
    describe package(name) do
      it { should be_installed }
    end
  end
end
