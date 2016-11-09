require_relative "test_helper"

class UserTest < Minitest::Test
  def test_exists
    User
  end

  def test_create_user
    new_user = User.new(name: "Alex")
    assert new_user.save!
  end
end
