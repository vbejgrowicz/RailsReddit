class Post < ApplicationRecord
  validates :title, :topic_id, presence: true

  belongs_to :topic
end
