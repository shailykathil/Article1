class Blog1 < ApplicationRecord
  has_many :comment1s, foreign_key: :blog_id, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end