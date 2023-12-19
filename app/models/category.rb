class Category < ApplicationRecord
    
    has_many :post_categories
    has_many :posts, through: :post_categories


    validates :name, presence: true, length:{minimum: 3, maximum: 25},
    uniqueness: { case_sensitive: false }
    
    
end