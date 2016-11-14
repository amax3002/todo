# require 'active_record'
#
class CreateUserTableMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamp null: false
    end
  end
end
