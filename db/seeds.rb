# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(nome: 'Administrador', login: 'Admin', email: 'trabalhos4.5.1.4@gmail.com', data_nascimento: '27/11/1999', password: '123456', password_confirmation: '123456', admin: true)