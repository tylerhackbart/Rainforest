class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name

  has_many :reviews
  has_many :products, :through => :reviews
end
