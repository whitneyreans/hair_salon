require('rspec')
require('pg')
require('stylist')
require('client')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
  end
end

describe(Client) do
  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the client's name") do
      client = Client.new({:name => "Mary Sue", :client_id => 1})
      expect(client.name()).to(eq("Mary Sue"))
    end
  end

  describe("#client_id") do
    it("lets you read the stylist ID for that client") do
      test_client = Client.new({:name => "Barbara Bush", :client_id => 1})
      expect(test_stylist.list_id()).to(eq(1))
    end
  end

  describe("#save") do
    it("lets you save clients to the database") do
      client = Client.new({:name => "Mary Sue", :client_id => 1})
      client.save()
      expect(client.all()).to(eq([client]))
    end
  end

  describe("#==") do
    it("is the same client if they has the same name") do
      client1 = client.new({:name => "Mary Sue", :client_id => 1})
      client2 = client.new({:name => "Mary Sue", :client_id => 1})
      expect(client1).to(eq(client2))
    end
  end
end
