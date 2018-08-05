module CurrentUserConcern
  extend ActiveSupport::Concern
# override the current_user by devise
  def current_user
# try current_user from devise, if it is nil, we will create a guest user obj.
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end