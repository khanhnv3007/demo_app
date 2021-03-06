class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  validates :text, presence: true, length: { maximum: 140 }
end
