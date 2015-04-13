# == Schema Information
#
# Table name: retweets
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  micropost_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Retweet < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  validates :micropost_id, presence: true
  validates :user_id, presence: true

  validate :cant_retweet_yourself

  private
    def cant_retweet_yourself
      if user_id == Micropost.find_by(id: micropost_id).user_id
        errors.add(:user_id, "can't retweet self")
      end
    end
end
