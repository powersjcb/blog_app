# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:jacob)
    # This code is not idiomatically correct.
    @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
  end


  test "should be valid" do
    assert @micropost.valid?    
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end


  test "content should be present" do
    @micropost.content = "    "
    assert_not @micropost.valid?
  end
end
