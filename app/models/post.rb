class Post < ApplicationRecord
    validates :title, :author, :category, :content, presence: true
    
end
