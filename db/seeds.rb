user1 = User.create(username: "angyangie", first_name: "Angie", last_name: "Ramirez", email: "angie.ramirez12@gmail.com", player_rank: "10", password: "hellothere1")
user2 = User.create(username: "mykemike", first_name: "Michael", last_name: "Appell", email: "mikeappell@gmail.com", player_rank: "3", password: "hellothere1")

game1 = Game.create(completed: true, game_type: "competitive", winner_id: user1.id)
game2 = Game.create(completed: false, game_type: "competitive")

user_game1 = UserGame.create(user: user1, game: game1)
user_game2 = UserGame.create(user: user2, game: game1)
user_game3 = UserGame.create(user: user1, game: game2)
user_game4 = UserGame.create(user: user2, game: game2)


ship2 = Ship.create(coordinates: "53,63", ship_type: "destroyer", user_game: user_game1)
ship3 = Ship.create(coordinates: "92,93,94,95" , ship_type: "battleship", user_game: user_game1)
ship4 = Ship.create(coordinates: "28,38,48,58,68", ship_type: "carrier", user_game: user_game1)
ship5 = Ship.create(coordinates: "11,12,13,14", ship_type: "battleship", user_game: user_game1)


ship6 = Ship.create(coordinates: "32,33,34", ship_type: "cruiser", user_game: user_game2)
ship7 = Ship.create(coordinates: "76,66", ship_type: "destroyer", user_game: user_game2)

ship11 = Ship.create(coordinates: "33,34,35", ship_type: "cruiser", user_game: user_game3)
ship12 = Ship.create(coordinates: "66,56", ship_type: "destroyer", user_game: user_game3)
ship13 = Ship.create(coordinates: "92,93,94,95" , ship_type: "battleship", user_game: user_game3)
ship14 = Ship.create(coordinates: "28,38,48,58,68", ship_type: "carrier", user_game: user_game3)
ship15 = Ship.create(coordinates: "11,12,13,14", ship_type: "battleship", user_game: user_game3)


ship16 = Ship.create(coordinates: "32,33,34", ship_type: "cruiser", user_game: user_game4)
ship17 = Ship.create(coordinates: "76,66", ship_type: "destroyer", user_game: user_game4)
ship18 = Ship.create(coordinates: "51,52,53,54" , ship_type: "battleship", user_game: user_game4)
ship19 = Ship.create(coordinates: "18,28,38,48,58", ship_type: "carrier", user_game: user_game4)
ship20 = Ship.create(coordinates: "23,24,25,26", ship_type: "battleship", user_game: user_game4)

