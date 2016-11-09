class Task < ActiveRecord::Base
  belongs_to :department
  validates :name, presence: true
end
