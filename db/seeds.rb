Admin.create_with(password: ENV['SUPER_ADMIN_PASSWORD'], password_confirmation: ENV['SUPER_ADMIN_PASSWORD']).find_or_create_by(email: ENV['SUPER_ADMIN_EMAIL'])

User.create_with(password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD'], first_name: ENV['ADMIN_FIRST_NAME'], last_name: ENV['ADMIN_LAST_NAME'], address: ENV['ADMIN_ADDRESS'], forem_admin: true, admin: true, approved: true).find_or_create_by(email: ENV['ADMIN_EMAIL'])
