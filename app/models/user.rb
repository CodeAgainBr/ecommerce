class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, authentication_keys: [:login]
 	
 	validates :login, presence: :true, uniqueness: { case_sensitive: false }

 	has_many :avaliacao, dependent: :delete_all
 	has_many :pedido, dependent: :delete_all
end
