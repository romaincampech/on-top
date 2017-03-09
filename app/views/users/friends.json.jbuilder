json.friends @friends do |friend|

    json.partial! 'users/friend', friend: friend

end
