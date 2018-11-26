class PagesController < ApplicationController
	def home
		@produtos = Produto.all
	end

	def categoria
		@categoria = Categoria.find(params[:categoria])
		@sub_categorias = SubCategoria.where(categoria_id: params[:categoria])
	end

	def sub_categoria
		@sub_categoria = SubCategoria.find(params[:sub_categoria])
		@produtos = Produto.where(sub_categoria: params[:sub_categoria])
	end

	def add_carrinho
		authenticate_user!
		@pedido = Pedido.where(user_id: current_user, status: "aberto").limit(1)[0]

		if @pedido.nil?
			@pedido = Pedido.new
			@pedido.titulo = DateTime.now.to_formatted_s(:number)
			@pedido.status = "aberto"
			@pedido.user = current_user
			@pedido.save
		end


		@item = Item.new
		@item.pedido = @pedido
		@item.produto = Produto.find(params[:id])
		@item.quantidade = 1
		@item.save

		redirect_to :back
	end
end