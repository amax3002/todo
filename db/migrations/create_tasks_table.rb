# require 'active_record'
#
class CreateTaskTableMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :user
      t.string :name
      t.date :due_date
      t.boolean :complete
      t.timestamp null: false
    end
  end
end
