class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_one_attached :profileImage
    #downcase email characters before saving to the database
    before_save {self.email = email.downcase }
    
    validates :username, presence:true, uniqueness:{ case_sensitive: false }, 
    length:{minimum: 2, maximum:30}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:true, uniqueness:{ case_sensitive: false }, 
    format:{with: VALID_EMAIL_REGEX}
    
    has_secure_password
end