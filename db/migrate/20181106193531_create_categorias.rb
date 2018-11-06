class CreateCategorias < ActiveRecord::Migration[5.0]
  def change
    create_table :categorias do |t|
      t.string :nome

      t.timestamps
    end
    add_index :categorias, :nome,	unique: true
  end
end
