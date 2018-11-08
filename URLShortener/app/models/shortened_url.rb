class ShortenedUrl < ApplicationRecord

  validates :long_url, :user_id, presence: true

  def self.random_code
    k = SecureRandom.urlsafe_base64 + '.com'
     
    while self.exists?(:short_url => k )
      k = SecureRandom.urlsafe_base64 + '.com'
    end
    k
  end
  
  def self.new_url(user, long)
    s = ShortenedUrl.new(long_url: long, short_url: self.random_code, user_id: user.id)
    s.save
    
  end
  
  
  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User 
end
