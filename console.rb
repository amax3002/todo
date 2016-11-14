require "pry"
require "active_record"

require_relative "db/connection"
require_relative "db/migrations/create_tasks_table"
require_relative "db/migrations/create_users_table"
require_relative "user"
require_relative "task"

Pry.start
