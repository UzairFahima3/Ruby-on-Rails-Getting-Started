class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true, length:{ minimum: 10 }
    has_one_attached :image
end
