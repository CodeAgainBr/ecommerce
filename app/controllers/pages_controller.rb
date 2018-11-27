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
		@produto = Produto.find(params[:id])

		if (@produto.quantidade - 1) <= 0
			respond_to do |format|
        format.html { redirect_to :back, alert: 'Quantidade em estoque insuficiente.\nQuantidade atual: '+@produto.quantidade }
	    end
	  else
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
		end
		
		redirect_to :back
	end

	def fazer_pedido
		authenticate_user!
		@falha = false
		@pedido = Pedido.find(:id)
		@produtos = Produto.where(pedido: @pedido)

		@produtos.each do |produto|
			if 1 > produto.quantidade
				respond_to do |format|
	        format.html { redirect_to :back, alert: 'Produto:'+produto.nome+'\nQuantidade em estoque insuficiente.\nQuantidade atual: '+produto.quantidade }
		    	@falha = true
		    end
			end
		end

		unless @falha
			@produtos.each do |produto|
				@nova_quantidade = produto.quantidade -= 1;
				produto.update(quantidade: @nova_quantidade)
			end

			@pedido.update(status: "andamento")
		end
	end
end