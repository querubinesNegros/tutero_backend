class Question < ApplicationRecord
  belongs_to :student
  belongs_to :topic
  has_many :answers

  validates :content, presence: true, length: {minimum: 12}

  def self.search(searchText)
    search_key = searchText.to_s.downcase
    where("lower(content) like ?", "%#{search_key}%")
    
  end

end
