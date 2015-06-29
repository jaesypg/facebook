class Like < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :status
  validate :unique_like_for_user

  def unique_like_for_user
    likes = Like.where(status_id: self.status_id)
    if  likes.session['id']
      false
    else
      true
    end
  end
end
