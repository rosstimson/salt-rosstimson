require_relative 'spec_helper'

describe 'wifi setup' do
  describe file('/boot/loader.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'wheel' }
    its(:content) { should match 'if_iwm_load="YES"' }
    its(:content) { should match 'iwm7260fw_load="YES"' }
  end

  describe file('/etc/rc.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'wheel' }
    its(:content) { should match 'wlans_iwm0="wlan0"' }
    its(:content) { should match 'ifconfig_wlan0="WPA SYNCDHCP"' }
  end

  describe file('/etc/wpa_supplicant.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'wheel' }
    its(:content) { should match /ssid=".*"$/ }
    its(:content) { should match /psk=".*"$/ }
  end
end

