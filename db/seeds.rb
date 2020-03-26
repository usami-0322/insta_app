User.create!(
             username:  "Exampl User",
             fullname:   "Exampl User",
             email:     "example@railstutoral.org",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  username  = Faker::Name.name
  fullname = username
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username:  username,
              fullname: fullname,
               email: email,
               password:              password,
               password_confirmation: password)
end     

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }