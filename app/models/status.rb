class Status < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments
  has_many :likes

  has_many :status_tags
  has_many :tags, :through => :status_tags
end


# @user.statuses.find_by(user_id: 6)
# @user.statuses.last
# @user.statuses.all
# @user.statuses.last.tags.all
# @user.statuses.last.tags.find_or_create_by(name: "Exam")
# @user.statuses.last.tags.find_or_create_by(name: "Exam 2")
# @user.statuses.create(feeling: "s3", comment: "c3")
# @user.statuses.find_by_feeling("s3")
# @user.statuses.find(17).tags.create(name: "exam 3")
# @user.statuses.find(17).tags.all
# @user.statuses.third.tags.all
