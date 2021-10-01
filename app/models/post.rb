class Post < ApplicationRecord
    validates :title, :author, :category, :content, presence: true

    has_many :comments
    
end
