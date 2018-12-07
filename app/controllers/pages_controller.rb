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
		@produto = Produto.where(id: params[:id])[0]

		unless @produto.nil?
			if (@produto.quantidade - params[:quantidade].to_i) <= 0
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
				@item.quantidade = params[:quantidade].to_i
				@item.save
			end
		end
		
		redirect_to :back
	end

	def fazer_pedido
		authenticate_user!
		@falha = false
		@pedido = Pedido.find(params[:id])
		@itens = Item.where(pedido: @pedido)

		@itens.each do |item|
			if item.quantidade > item.produto.quantidade
				respond_to do |format|
	        format.html { redirect_to pedidos_path, alert: 'Produto:'+item.produto.nome+'\nQuantidade em estoque insuficiente.\nQuantidade atual: '+item.produto.quantidade }
		    	@falha = true
		    end
			end
		end

		unless @falha
			@itens.each do |item|
				@nova_quantidade = item.produto.quantidade -= item.quantidade;
				item.update(quantidade: @nova_quantidade)
			end

			@pedido.update(status: "andamento")
			respond_to do |format|
		      format.html { redirect_to pedidos_path, notice: "Pedido efetuado!" }
		    end
		end
	end
end