class PagesController < ApplicationController
	def home
		@produtos = Produto.all
	end

	def categoria
		@sub_categorias = SubCategoria.where(categoria_id: params[:categoria])
	end
end