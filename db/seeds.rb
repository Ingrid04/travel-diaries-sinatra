# USERS

kim = User.create(username: "Kim", password: "kim")
jen = User.create(username: "Jen", password: "jen")
lola = User.create(username: "Lola", password: "lola")
patty = User.create(username: "Patty", password: "patty")

story1 = Story.create(content: "NYC the best city in the world!", user_id: 1)
story2 = Story.create(content: "Barcelona the best city in Europe!", user_id: 2)
story3 = Story.create(content: "London is a fun city!", user_id: 3)
story4 = Story.create(content: "Rome is a city with a lot of ruins", user_id: 4)
