module CurrentUserConcern
  extend ActiveSupport::Concern
# override the current_user by devise
  def current_user
# try current_user from devise, if it is nil, we will create a guest user obj.
    super || guest_user
  end
  def guest_user
    # create a mini structure for guest user
    OpenStruct.new(name: "Guest User",
                   first_name: "Guest",
                   last_name: "User",
                   email: "guest@example.com"
    )
  end
end