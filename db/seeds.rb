# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Ticket.destroy_all
SportSection.destroy_all
SportSectionsUser.destroy_all
TicketsUser.destroy_all
Comment.destroy_all

User.create(
  email: 'admin@admin',
  password: '123456',
  password_confirmation: '123456',
  role: 2
  )

owner = User.create(
  email: 'owner@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  role: 1,
  )
owner.approved = true
owner.save

user = User.create(
  email: 'kirill@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  role: 0
  )

20.times do |index|
  User.create(
    email: Faker::Internet.unique.email,
    password: '123456',
    password_confirmation: '123456',
    role: rand(0..1)
    )
end

50.times do |index|
  SportSection.create(
    name: Faker::Team.sport,
    coach_name: Faker::Name.name,
    description: Faker::Hipster.sentence,
    address: Faker::Address.street_address
    )
end

sport_sections = SportSection.all.to_a
20.times do
  section = sport_sections.sample
  owner.sport_sections << section
  sport_sections.delete(section)
end

50.times do |index|
  Ticket.create(
    expire_date: Faker::Date.between(7.days.ago, 3.months.from_now),
    visits_remaining: [rand(1..12), nil].sample,
    cost: rand(1..30)
    )
end

tickets = Ticket.all.to_a
20.times do
  ticket = tickets.sample
  sport_sections = owner.sport_sections.to_a
  rand(1..3).times do |index|
    section = sport_sections.sample
    ticket.sport_sections << sport_sections.sample
    owner.tickets << ticket
    sport_sections.delete(section)
  end
  tickets.delete(ticket)
end

tickets.each do |ticket|
  ticket.sport_sections << SportSection.all.to_a.sample
end

20.times do |index|
  Comment.create(
    commentable_id: Ticket.first.id,
    commentable_type: Ticket,
    body: Faker::Hipster.sentence,
    user_id: user.id
    )
end
