require('rspec')
require('stylist')
require('client')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
  end
end


describe(Stylist) do
  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a stylist to the array of saved stylists") do
      test_stylist = Stylist.new({:name => "Bobby Brown", :id => nil})
      test_stylist.save()
      expect(stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#name") do
    it("returns the name of stylist") do
      test_stylist = Stylist.new({:name => "Bobby Brown", :id => nil})
      expect(test_stylist.name()).to(eq("Bobby Brown"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Bobby Brown", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same stylist if they has the same name and list ID") do
      stylist1 = Stylist.new({:name => "Bobby Brown", :id => nil})
      stylist2 = Stylist.new({:name => "Bobby Brown", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end
end
