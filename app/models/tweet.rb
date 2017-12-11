class Tweet < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: { maximum: 140, too_long: 'A tweet is only 140 characters max.' } 
end

# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  message    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
