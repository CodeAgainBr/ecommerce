json.extract! produto, :id, :nome, :sub_categoria_id, :marca, :cor, :preco, :garantia, :peso, :validade, :modelo, :descricao, :quantidade, :vendas, :created_at, :updated_at
json.url produto_url(produto, format: :json)
