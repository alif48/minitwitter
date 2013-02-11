namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "alifu48",
                         email: "alifpratamaputra@gmail.com",
                         password: "123456",
                         password_confirmation: "123456")
    admin.toggle!(:admin)


    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

  user = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    user.each { |user| user.microposts.create!(content: content) }
  end

    def make_relationships
      users = User.all
      user  = users.first
      followed_users = users[2..50]
      followers      = users[3..40]
      followed_users.each { |followed| user.follow!(followed) }
      followers.each      { |follower| follower.follow!(user) }
    end

  end
end