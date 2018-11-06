class CreateAvaliacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :avaliacoes do |t|
      t.string :titulo
      t.text :descricao
      t.integer :nota,   default: 0
      t.belongs_to :user, foreign_key: true
      t.belongs_to :produto, foreign_key: true

      t.timestamps
    end
  end
end
