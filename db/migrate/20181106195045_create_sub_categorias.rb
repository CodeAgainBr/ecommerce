class CreateSubCategorias < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categorias do |t|
      t.string :nome
      t.belongs_to :categoria, foreign_key: true

      t.timestamps
    end
  end
end
