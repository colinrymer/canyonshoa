Admin.create_with(password: ENV['SUPER_ADMIN_PASSWORD'], password_confirmation: ENV['SUPER_ADMIN_PASSWORD']).find_or_create_by(email: ENV['SUPER_ADMIN_EMAIL'])

User.create_with(password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD'], first_name: ENV['ADMIN_FIRST_NAME'], last_name: ENV['ADMIN_LAST_NAME'], address: ENV['ADMIN_ADDRESS'], forem_admin: true, admin: true, approved: true).find_or_create_by(email: ENV['ADMIN_EMAIL'])

CANYONS_LOTS = YAML.load(File.read(File.join(Rails.root, 'db/canyons_lots.yml')))

CANYONS_LOTS.map { |r| r[:street] }.uniq.compact.each do |street_name|
  Street.find_or_create_by(name: street_name)
end

CANYONS_LOTS.delete_if { |r| r[:street].nil? || r[:lot].nil? }.each do |lot|
  Lot.create_with(number: lot[:number], street_id: Street.find_by(name: lot[:street]).id).find_or_create_by(id: lot[:lot])
end
