class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  
  #name validations
  validates(
    :name,
      presence: true,
      length:  { maximum: 50 }
  )
  

  #email validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(
    :email, 
      presence: true,
      length: { maximum: 255 },
      format: {with: VALID_EMAIL_REGEX},
      uniqueness: {case_sensitive: false}
  )


  #password validations
  has_secure_password
  validates( :password, length: {minimum: 6} )

end
