Pact.provider_states_for 'Projects Consumer' do

  provider_state "at least one project exists" do
    set_up do
      # Create a thing here using your framework of choice
      # eg. Sequel.sqlite[:somethings].insert(name: "A small something")
    end

    tear_down do
      # Any tear down steps to clean up your code
    end
  end
end
