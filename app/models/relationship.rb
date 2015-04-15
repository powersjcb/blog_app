# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true 
  validates :followed_id, presence: true
  validate :cant_follow_yourself


  private
    def cant_follow_yourself
      if follower_id == followed_id
        errors.add(:followed_id, "can't follow yourself")
      end
    end
end
