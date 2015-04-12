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

  validates :user_id, presence: true
  validates :micropost_id, presence: true


end
