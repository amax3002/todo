require "minitest/autorun"
require "minitest/pride"
require "active_record"
require "pry"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/test.sqlite3"
)

require_relative "../task"
require_relative "../user"
require_relative "../app"
require_relative "../db/migrations/create_todos_table"

begin
  CreateTodosTableMigration.migrate(:down)
rescue ActiveRecord::StatementInvalid
end

CreateTodosTableMigration.migrate(:up)
