require_relative "test_helper"

class AppTest < Minitest::Test
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def new_task!
    Task.create!(name: "Alex", complete: false)
  end


  def test_get_root
    get "/"
    assert last_response.ok?
    assert_match /Task List/, last_response.body
  end

  def test_get_all_tasks
    get "/tasks"
    assert last_response.ok?
    assert_match /Task List/, last_response.body
  end

  def test_new_task
    get "/tasks/new"
    assert last_response.ok?
    assert_match /Task List/, last_response.body
  end

  def test_get_specific_task_by_id
    task = new_task!
    get "/tasks/#{task.id}"
    assert last_response.ok?
    assert_match task.name, last_response.body
  end

  def test_post_new_task
    new_task!
    post "/tasks"
    # assert last_response.ok?
    assert_match /Task List/, last_response.body
  end

  def test_edit_task
    task = new_task!
    get "/tasks/#{task.id}/edit"
    assert last_response.ok?
    assert_match task.name, last_response.body
  end

  def test_delete_task
    task = new_task!
    delete "/tasks/#{task.id}"
    assert_equal task.id, nil
  end

  def test_get_task_by_name
    task = new_task!
    get "/tasks/#{task.name}"
    assert_equal task.name, last_response.body
  end

  def test_search_task
    task = new_task!
    post "/tasks/search", params: [task.id]
    assert_equal task.name, last_response.body
  end

  def test_get_specific_task_by_id_patch
    task = new_task!
    patch "/tasks/#{task.id}"
    assert_match task.name, last_response.body
  end

  def test_next_task
    task = new_task!
    post "/next"
    assert_equal task.complete, false
  end

end
