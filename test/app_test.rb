require_relative "test_helper"

class AppTest < Minitest::Test
  # include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def test_create_user
    new_user = Task.new(name: "Alex")
    assert new_user.save!
  end

  def test_can_read_single_employee
    post "/tasks", params: { task: {name: "Alex"}}
    assert last_response.ok?
    assert_equal "Alex", JSON.parse(last_response.body)["name"]
  end
end
