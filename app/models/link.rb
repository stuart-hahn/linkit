class Link < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :url, uniqueness: { case_sensitive: false }, allow_blank: true
end
