class SubCategoria < ApplicationRecord
  belongs_to :categoria
  has_many :produto, dependent: :delete_all
end
