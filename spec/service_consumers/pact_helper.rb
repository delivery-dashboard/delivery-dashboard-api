require 'pact/provider/rspec'

require './spec/service_consumers/provider_states_for_project_consumer.rb'

Pact.service_provider 'Projects Provider' do
  honours_pact_with 'UI' do
    pact_uri '/tmp/pacts/projects_consumer-projects_provider.json'
  end
end