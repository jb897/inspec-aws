# frozen_string_literal: true
client_vpn_endpoint_id = attribute('client_vpn_endpoint_id', value: '', description: '')
control 'aws_ec2_client_vpn_endpoints-1.0' do
  impact 1.0
  title 'Test the properties of the vpn endpoints.'
  describe aws_ec2_client_vpn_endpoints do
    it { should exist }
    its('client_vpn_endpoint_ids') { should include client_vpn_endpoint_id }
    its('descriptions') { should include "Example Client VPN endpoint" }
    its('dns_names') { should include '*.cvpn-endpoint-08720d356dd9928c8.prod.clientvpn.us-east-2.amazonaws.com' }
    its('split_tunnels') { should include false }
    its('vpn_protocols') { should include 'openvpn' }
    its('transport_protocols') { should include 'udp' }
    its('vpn_ports') { should include 44365 }
    its('server_certificate_arns') { should include 'arn:aws:acm:us-east-2:9999999999:certificate/a20fe841-b1ef-4785-aefb-e69838eacdcb' }
  end
end
