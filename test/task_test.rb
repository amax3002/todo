require_relative "test_helper"

class TaskTest < Minitest::Test
  def test_exists
    Task
  end

  def test_create_task
    new_task = Task.new(name: "Important Task")
    assert new_task.save!
  end
end
