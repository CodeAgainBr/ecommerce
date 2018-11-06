class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.string :titulo
      t.string :status,   default: "Aguardando pagamento"
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
