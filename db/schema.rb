# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181106203610) do

  create_table "avaliacoes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "titulo"
    t.text     "descricao",  limit: 65535
    t.integer  "nota",                     default: 0
    t.integer  "user_id"
    t.integer  "produto_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["produto_id"], name: "index_avaliacoes_on_produto_id", using: :btree
    t.index ["user_id"], name: "index_avaliacoes_on_user_id", using: :btree
  end

  create_table "categorias", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_categorias_on_nome", unique: true, using: :btree
  end

  create_table "itens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "quantidade", default: "0"
    t.integer  "produto_id"
    t.integer  "pedido_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["pedido_id"], name: "index_itens_on_pedido_id", using: :btree
    t.index ["produto_id"], name: "index_itens_on_produto_id", using: :btree
  end

  create_table "pedidos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "titulo"
    t.string   "status",     default: "Aguardando pagamento"
    t.integer  "user_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["user_id"], name: "index_pedidos_on_user_id", using: :btree
  end

  create_table "produtos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.string   "marca"
    t.string   "cor"
    t.float    "preco",            limit: 24,    default: 0.0
    t.integer  "garantia",                       default: 0
    t.float    "peso",             limit: 24,    default: 0.0
    t.datetime "validade"
    t.string   "modelo"
    t.text     "descricao",        limit: 65535
    t.integer  "quantidade",                     default: 0
    t.integer  "vendas",                         default: 0
    t.integer  "sub_categoria_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["sub_categoria_id"], name: "index_produtos_on_sub_categoria_id", using: :btree
  end

  create_table "sub_categorias", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.integer  "categoria_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["categoria_id"], name: "index_sub_categorias_on_categoria_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.string   "login"
    t.string   "email",                             default: "",    null: false
    t.date     "data_nascimento"
    t.string   "cpf"
    t.float    "credito",                limit: 24, default: 0.0
    t.boolean  "admin",                             default: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["login"], name: "index_users_on_login", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "avaliacoes", "produtos"
  add_foreign_key "avaliacoes", "users"
  add_foreign_key "itens", "pedidos"
  add_foreign_key "itens", "produtos"
  add_foreign_key "pedidos", "users"
  add_foreign_key "produtos", "sub_categorias"
  add_foreign_key "sub_categorias", "categorias"
end
