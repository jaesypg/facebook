class User < ActiveRecord::Base
  # Remember to create a migration!
  # e.g., User.authenticate('josh@codedivision.com', 'apples123')
  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    @user = self.find_by_email(email)
    if @user
      if @user[:password] == password
        return @user
      end
    end
  end

end
