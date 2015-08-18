require("spec_helper")

describe(Task) do
  describe('#==') do
    it('is the same task if it has the same description') do
      task1 = Task.new({:description => "learning SQL", :list_id => 1})
      task2 = Task.new({:description => "learning SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id =>1})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe(".order_by") do
    it("sorts task based by its description") do
      test_task1 = Task.new({:description => "walk dog", :list_id => 2})
      test_task1.save()
      test_task2 = Task.new({:description => "feed cat", :list_id => 3})
      test_task2.save()
      test_task3 = Task.new({:description => "walk dog", :list_id => 4})
      test_task3.save()
      expect(Task.order_by()).to(eq([test_task2, test_task1, test_task3]))

    end

  end
end
