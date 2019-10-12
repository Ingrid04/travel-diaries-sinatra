# USERS
User.delete_all
Story.delete_all

kim = User.create(username: "Kim", email: "kim@mail.com", password: "kim")
jen = User.create(username: "Jen", email: "jen@mail.com", password: "jen")
lola = User.create(username: "Lola", email: "lola@mail.com", password: "lola")
patty = User.create(username: "Patty", email: "patty@mail.com", password: "patty")

story1 = Story.create(content: "NYC the best city in the world!", user_id: 1)
story2 = Story.create(content: "Barcelona the best city in Europe!", user_id: 2)
story3 = Story.create(content: "London is a fun city!", user_id: 3)
story4 = Story.create(content: "Rome is a city with a lot of ruins", user_id: 4)
