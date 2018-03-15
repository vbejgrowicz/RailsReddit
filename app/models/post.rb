class Post < ApplicationRecord
  validates :title, :topic_id, presence: true

  belongs_to :topic
  has_many :vote, as: :votable

  def total_votes
    vote.map(&:value).sum
  end
end
