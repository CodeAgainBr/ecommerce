class Pedido < ApplicationRecord
  belongs_to :user
  has_many :item, dependent: :delete_all
end
