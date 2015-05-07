require 'bcrypt'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :articles
  # paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def in_role?(role)
  		role == @role
	end

	def assign_role(role)
    @role = role
  		
	end

# Creates virtual password+password_confirmation attributes on your model, which are not stored in the database (that would be very insecure)
# Validates that password & password_confirmation attributes match
# Uses bcrypt to hash the password and store it in the model's password_digest attribute
	
 #  BCrypt::Engine.cost = 12


 #  attr_reader :password 
 #  validates_confirmation_of :password
 #  validates_presence_of :password_digest

 # def authenticate(unencrypted_password)
 #    if BCrypt::Password.new(password_digest) == unencrypted_password
 #      self
 #    else
 #      false
 #    end
 #  end


 #  def password=(unencrypted_password)
 #    if unencrypted_password.nil?
 #    	## when nil password_digest is nil
 #      self.password_digest = nil
 #    else 
 #    	## when not nil update password just for temporary reference
 #      @password = unencrypted_password
 #      ## update password_digest using hashing algorithm
 #      self.password_digest = BCrypt::Password.create(@password)
 #    end
 #  end

 #    def self.confirm(email_param, password_param)
 #      user = User.find_by({email: email_param})
 #      user.authenticate(password_param)
 #    end


end
