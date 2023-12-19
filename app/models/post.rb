class Post < ApplicationRecord
    
    has_many :post_categories
    has_many :categories, through: :post_categories
    
    has_one_attached :thumbnail
    validates :title, presence: true, length: {maximum:110, minimum:10}
    validates :content, presence: true, length: {minimum:20}
end