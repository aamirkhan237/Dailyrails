class Follow < ApplicationRecord

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  belongs_to :follower, polymorphic: true
  belongs_to :followable, polymorphic: true
  belongs_to :user

  def block!
    self.update_attribute(:blocked, true)
  end
  def unblock!
    self.update_attribute(:blocked, false)
  end
end
