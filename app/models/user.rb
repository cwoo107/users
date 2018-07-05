class User < ApplicationRecord
	attr_accessor :password_confirmation
	no_whitespace = /\A[\w\_]+\z/
	EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :presence => true, :format => EMAIL_REGEX
	validates :company_name, :presence => true
	validates :company_mailing_address, :presence => true
	validates :city, :presence => true
	validates :state, :presence => true
	validates :zip, :presence => true, :length =>{ :is => 5}, format: { with: /[0-9]/}
	validates :company_phone_number, :presence => true, format: { with: /[0-9]/}, :length =>{ :is => 10}
	validates :password, :confirmation => true, :presence => true, :length =>{ :in => 6..14}, format: { with: /\A[\w\_]+\z/}
	validates :company_type, :presence => true, inclusion: { in: %w(Contractor Member)}
	validates :user_name, :presence => true, format: { with: no_whitespace}, :length =>{ :in => 6..14}
	validates :password_confirmation, :presence => true
	
end
