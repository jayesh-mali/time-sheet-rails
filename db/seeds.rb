# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_users(users)
  users.each do |user|
    User.create!(user)
  end
  puts "#{users.count} users created successfully"
end

def create_projects(projects)
  manager = User.first
  projects.each do |project|
    project = Project.new(project)
    project.assign_attributes(manager_id: manager.id)
    project.save!
  end
  puts "#{projects.count} projects created successfully"
end

users = [
  { name: "John", employee_id: "E12/001", email: "john@gmail.com" },
  { name: "Smith", employee_id: "E12/002", email: "smith@gmail.com" },
  { name: "Jake", employee_id: "E12/003", email: "jake@gmail.com" },
  { name: "Harry", employee_id: "E12/004", email: "harry@gmail.com" },
  { name: "James", employee_id: "E12/005", email: "james@gmail.com" },
]

projects = [
  { name: "project-1" },
  { name: "project-2" },
  { name: "project-3" } 
]

ActiveRecord::Base.transaction do
    create_users(users)
    create_projects(projects)
end
