class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :status_tags
  has_many :statuses, :through => :status_tags
  validates :name, presence: true

end
