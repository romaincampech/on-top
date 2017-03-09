module MessagesHelper
  def recipients_options
    s = ''
    current_user.friendlist.each do |friend|
      s << "<option value='#{friend.id}' data-img-src='#{image_tag "profile-avatar-default.jpg"}'>#{friend.full_name}</option>"
    end
    s.html_safe
  end
end
