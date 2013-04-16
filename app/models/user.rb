class User < ActiveRecord::Base
  has_many :comments
  has_secure_password
  attr_accessible :email, :username, :password

  EMAIL_REGEX = /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/

  before_create :downcase_email
  before_save   :create_remember_token

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => EMAIL_REGEX}
  validates :password, :presence => true 

  private

    def downcase_email
      self.email = self.email.downcase
    end

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
