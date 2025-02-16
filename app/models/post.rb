class Post < ApplicationRecord
    belongs_to :user
    has_many :episodes
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
  
    validates :title, presence: true, length: { maximum: 255 }
    validates :body, presence: true, length: { maximum: 65_535 }
  end
  