require "pry"
require "active_record"
require_relative "../task"
require_relative "../user"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/dev.sqlite3"
)
