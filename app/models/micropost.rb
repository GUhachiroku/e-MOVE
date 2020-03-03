class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  def self.search(search)
    if search
      Micropost.where(["content LIKE ?", "%#{search}%"])
    else
      Micropost.all
    end
  end
end