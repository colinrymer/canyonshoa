# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create_with(password: ENV['SUPER_ADMIN_PASSWORD'], password_confirmation: ENV['SUPER_ADMIN_PASSWORD']).find_or_create_by(email: 'colin.rymer@gmail.com')

User.create_with(password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD'], first_name: "Colin", last_name: "Rymer", address: "5887 Sunset Canyon Dr.", forem_admin: true, admin: true, approved: true).find_or_create_by(email: 'colin.rymer@gmail.com')
