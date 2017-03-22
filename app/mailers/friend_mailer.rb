class FriendMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.friend_mailer.request.subject
  #
  def request(friend, user)
    @friend = friend
    @user = user
    mail(to: @friend.email,
      subject: "You have been sent a friend request")
  end
end
