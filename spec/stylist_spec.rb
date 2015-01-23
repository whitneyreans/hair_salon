require('spec_helper')



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
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#name") do
    it("returns the name of stylist") do
      test_stylist = Stylist.new({:name => "Bobby Brown", :id => nil})
      expect(test_stylist.name()).to(eq("Bobby Brown"))
    end
  end

  describe(".find") do
    it("finds a stylist by their ID number") do
      test_stylist = Stylist.new({:name => "Homer Simpson", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Albert Einstein", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Bobby Brown", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#clients") do
    it("returns an array of clients belonging to that stylist") do
      test_stylist = Stylist.new({:name => "Mary Ann", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Kevin Bacon", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Kevin Spacey", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
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
