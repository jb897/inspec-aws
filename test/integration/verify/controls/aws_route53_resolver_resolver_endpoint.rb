resolver_endpoint_id = attribute("aws_resolver_endpoint_id", default: "", description: "")
aws_resolver_endpoint_vpc_id = attribute("aws_resolver_endpoint_vpc_id", default: "", description: "")
aws_resolver_endpoint_name = attribute("aws_resolver_endpoint_name", default: "", description: "")
aws_resolver_endpoint_arn = attribute("aws_resolver_endpoint_arn", default: "", description: "")
control 'aws-route53-resolver-resolver-endpoint-1.0' do
    impact 1.0
    title 'Describes the endpoint of the route53 resolver.'
  
    describe aws_route53resolver_resolver_endpoint(resolver_endpoint_id: resolver_endpoint_id) do
        it { should exist }
    end

    describe aws_route53resolver_resolver_endpoint(resolver_endpoint_id: resolver_endpoint_id) do
        its('id') { should eq resolver_endpoint_id}
        its('arn') { should eq aws_resolver_endpoint_arn }
        its('name') { should eq aws_resolver_endpoint_name }
        its('direction') { should eq "INBOUND" }
        its('ip_address_count') { should eq 2 }
        its('host_vpc_id') { should eq aws_resolver_endpoint_vpc_id }
        its('status') { should eq "OPERATIONAL" }
        its('status_message') { should eq "This Resolver Endpoint is operational." }
    end
  
    describe aws_route53resolver_resolver_endpoint(resolver_endpoint_id: 'dummy') do
        it { should_not exist }
    end
end