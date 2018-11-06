# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Variables
      t.string :nome
      t.string :login
      t.string :email,              null: false, default: ""
      t.date :data_nascimento
      t.string :cpf
      t.float :credito,                          default: 0.0
      t.boolean :admin,                          default: false
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.integer  :sign_in_count,    null: false, default: 0


      t.timestamps null: false
    end

    add_index :users, :login,                unique: true
    add_index :users, :email,                unique: true
    add_index :users, :cpf,                  unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
