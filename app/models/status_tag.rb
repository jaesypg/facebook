class StatusTag < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :status
  belongs_to :tag
end