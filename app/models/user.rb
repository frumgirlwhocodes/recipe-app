class User < ApplicationRecord

  
   has_many :recipes 
   has_many :comments 
   has_secure_password 
   
   
   validates :name, presence: true, length: { minimum: 3, maximum: 40 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX }
   
                      def self.from_omniauth(auth)
                        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
                          user.provider = auth.provider
                          user.uid = auth.uid
                          user.name = auth.info.name
                    
                          user.save!
                        end
                      end

end
