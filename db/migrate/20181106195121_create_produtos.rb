class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.belongs_to :sub_categoria, foreign_key: true
      t.string :marca
      t.string :cor
      t.float :preco
      t.integer :garantia
      t.float :peso
      t.datetime :validade
      t.string :modelo
      t.text :descricao
      t.integer :quantidade
      t.integer :vendas

      t.timestamps
    end
  end
end
