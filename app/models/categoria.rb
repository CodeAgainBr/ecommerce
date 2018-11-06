class Categoria < ApplicationRecord
	has_many :sub_categoria, dependent: :delete_all
end
