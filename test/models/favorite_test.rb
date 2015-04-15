require 'test_helper'


class FavoriteTest < ActiveSupport::TestCase

  def setup
    @user  = users(:jacob)
    @other = users(:archer)
    @favorite = @user.favorites.new(user_id: 1, 
                              micropost_id: @other.microposts.first.id )
  end

  test "is valid" do
    assert @favorite.valid?
  end

  test "is invalid with no user" do
    @favorite.user_id = nil
    assert_not @favorite.valid?
  end

  test "is invalid with no micropost" do
    @favorite.micropost_id = nil
    assert_not @favorite.valid?
  end
end