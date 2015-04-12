# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  fav_user_id :integer
#  fav_post_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Favorite < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :micropost_id, presence: true

end
