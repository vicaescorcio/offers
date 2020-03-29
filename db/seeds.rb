# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
companies = %w[Acme Globex Soylent Initech
               Dundler Mifflin Alchmex Oscorp
               Wayne Umbrella Starks Wonka]

40.times do |index|
  name = companies.sample(2)

  if index.even?
    ends = Time.zone.now + index.days
    premium = true
  else
    ends = nil
    premium = false
  end

  Offer.create(
    company: "#{name.join(' ')} Company",
    advertiser_name: "#{index * 2}%",
    url: "https://#{name.join('-')}.com",
    description: 'We are the best company in whole world!',
    starts_at: Time.zone.now - 1.days,
    ends_at: ends,
    premium: premium,
    status: 'enabled'
  )
end

AdminUser.create(username: 'admin', password: 'password')
