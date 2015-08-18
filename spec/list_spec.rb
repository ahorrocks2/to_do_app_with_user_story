require("spec_helper")

describe(List) do
  describe('.all') do
    it('starts off with no lists') do
      expect(List.all()).to(eq([]))

    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicudoes stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end

  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#tasks") do
    it("pull out tasks based on a specific list id") do
      test_list1 = List.new({:name => "One", :id => nil})
      test_list1.save()
      test_task1 = Task.new({:description => "Test Task", :list_id => test_list1.id()})
      test_task1.save()
      expect(test_list1.tasks()).to(eq([test_task1]))
    end
  end

end
