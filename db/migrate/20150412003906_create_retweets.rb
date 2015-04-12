class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.integer :retweeter_id
      t.integer :retweet_post_id

      t.timestamps null: false
    end

    # search for displaying tweet as part of someone's feed
    add_index :retweets, :retweeter_id
    # search for when displaying on OP's page to show list of RTs
    add_index :retweets, :retweet_post_id

    add_index :retweets, [:retweeter_id, :retweet_post_id], unique: true
  end
end
