class Visit < ApplicationRecord
  validates :user_id, :shortened_url_id, presence: true
  
  def self.record_visit!(user, shortened_url)
    visit = Visit.new(user_id: user.id, shortened_url_id: shortened_url.id)
    visit.save 
    visit 
  end 
  
  belongs_to :visitors,
  primary_key: :id, 
  foreign_key: :user_id,
  class_name: :User 
  
  belongs_to :visited_urls,
  primary_key: :id,
  foreign_key: :shortened_url_id,
  class_name: :ShortenedUrl
  
end
