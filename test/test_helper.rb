ENV["RACK_ENV"]="test"

require 'simplecov'
SimpleCov.start

require "minitest/autorun"
require "minitest/pride"
require "active_record"
require "pry"
require "rack/test"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/test.sqlite3"
)

require_relative "../task"
require_relative "../user"
require_relative "../app"
require_relative "../db/migrations/create_tasks_table"
require_relative "../db/migrations/create_users_table"

begin
  CreateUserTableMigration.migrate(:down)
  CreateTaskTableMigration.migrate(:down)
rescue ActiveRecord::StatementInvalid
end

CreateUserTableMigration.migrate(:up)
CreateTaskTableMigration.migrate(:up)
