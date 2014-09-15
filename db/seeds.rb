# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING ROLES'
Role.create([
  { :name => 'superadmin' },
  { :name => 'admin_user' },
  { :name => 'user' },
  { :name => 'onlineassistant' },
  { :name => 'uploader' },
  { :name => 'past_questions_admin' },
  { :name => 'class_note_admin' },
  { :name => 'library_admin' },
  { :name => 'voucher_admin' },
  { :name => 'ads_updates_admin' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'internet', :password_confirmation => 'internet'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => '3rdimenxion', :password_confirmation => '3rdimenxion'
puts 'New user created: ' << user2.name
user.add_role :superadmin
user2.add_role :admin_user
