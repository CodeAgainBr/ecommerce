class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :marca
      t.string :cor
      t.float :preco,           default: 0.0
      t.integer :garantia,      default: 0
      t.float :peso,            default: 0.0
      t.date :validade
      t.string :modelo
      t.text :descricao
      t.integer :quantidade,    default: 0
      t.integer :vendas,        default: 0
      t.string :imagem
      t.belongs_to :sub_categoria, foreign_key: true

      t.timestamps
    end
  end
end
