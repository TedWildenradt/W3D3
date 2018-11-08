class Visit < ApplicationRecord
  validations: :user_id, :shortened_url_id, presence: true
  
  def self.record_visit!(user, shortened_url)
  
  end 
end
