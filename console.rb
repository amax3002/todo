require "pry"
require "active_record"

require_relative "db/connection"
require_relative "db/migrations/create_todos_table"
require_relative "user"
require_relative "task"

Pry.start
