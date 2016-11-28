class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }

  validate :not_self
  validate :not_pending
  # validate :not_friends

  def accept
    Friendship.create(user: self.user, friend: self.friend)
    destroy
  end

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end

  def not_pending
    errors.add(:friend, "already requested friendship") if friend.pending_friends.include?(user)
  end

  # def not_friends
  #   errors.add(:friend, "is aldready added") if user.friends.include?(friend)
  # end
end
