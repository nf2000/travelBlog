class Comment < ApplicationRecord
    validates :comment, :name, presence: true
    belongs_to :post
end
