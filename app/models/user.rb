class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { in: 3..20 }
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }

 def self.authenticate_with_credentials(email,password)
  user = User.find_by_email((email.strip).downcase)  # puts user.authenticate(password)
  if(user && user.authenticate(password))
   user
  end
 end

  def downcase_email
    self.email.downcase!
  end
end

