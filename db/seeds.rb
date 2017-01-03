User.delete_all
User.reset_pk_sequence #with gem reset sequence
User.create!(
    [
        {name: 'Sullivan', email: 'sully@gmail.com', password: 'sully1'},
        {name: 'Nathan Drake', email: 'treasure-hunter@gmail.com', password: 'nathandrake'},
        {name: 'Elena Fisher', email: 'efisher@gmail.com', password: 'elenafisher'},
        {name: 'Yukimura Sanada', email: 'ysanada@gmail.com', password: 'nobushige'},
        {name: 'Shingen Takeda', email: 'tigerofkai@gmail.com', password: 'kaitiger'},
        {name: 'Sasuke Sarutobi', email: 'shinobi@gmail.com', password: 'shinobi'}
    ]
)

Relationship.delete_all
Relationship.reset_pk_sequence
Relationship.create!(
    [
        {followed_id: 1, follower_id: 2},
        {followed_id: 2, follower_id: 3},
        {followed_id: 3, follower_id: 2},
        {followed_id: 4, follower_id: 6},
        {followed_id: 5, follower_id: 4}
    ]
)

Category.delete_all
Category.reset_pk_sequence
Category.create!(
    [
        {name: 'Platforms'},
        {name: 'Games'},
        {name: 'Books'},
        {name: 'Movies'}
    ]
)

Image.delete_all
Image.reset_pk_sequence
Image.create!(
    [
        {file: '1.jpeg', category_id: 2},
        {file: '2.jpg', category_id: 2},
        {file: '3.jpg', category_id: 2},
        {file: '4.jpg', category_id: 2},
        {file: '5.png', category_id: 1},
        {file: '6.jpg', category_id: 1},
        {file: '7.jpg', category_id: 1},
        {file: '8.jpg', category_id: 1},
        {file: '9.jpg', category_id: 1},
        {file: '10.jpg', category_id: 1},
        {file: '11.jpg', category_id: 1},
        {file: '12.png', category_id: 1},
        {file: '13.jpg', category_id: 1}
    ]
)

Platform.delete_all
Platform.reset_pk_sequence
Platform.create!(
    [
        {family: 'PlayStation', name: 'PlayStation3', category_id: 1, image_id: 5},
        {family: 'PlayStation', name: 'PlayStation4', category_id: 1, image_id: 6},
        {family: 'PlayStation', name: 'PlayStation Vita', category_id: 1, image_id: 7},
        {family: 'XBox', name: 'XBox 360', category_id: 1, image_id: 8},
        {family: 'XBox', name: 'XBox One', category_id: 1, image_id: 9},
        {family: 'PC', name: 'Microsoft Windows', category_id: 1, image_id: 10},
        {family: 'PC', name: 'Mac OS', category_id: 1, image_id: 11},
        {family: 'Nintendo', name: 'Nintendo DS', category_id: 1, image_id: 12},
        {family: 'Nintendo', name: 'Nintendo 3DS', category_id: 1, image_id: 13}
    ]
)

Game.delete_all
Game.reset_pk_sequence
Game.create!(
    [
        {name: 'Dark Souls', category_id: 2, genre: 'Action/RPG', year: 2011, company: 'FromSoftware, n-Space', image_id: 1},
        {name: 'Sengoku Basara 4', category_id: 2, genre: 'Hack and slash', year: 2014, company: 'Capcom', image_id: 2},
        {name: 'Samurai Warriors 4', category_id: 2, genre: 'Hack and slash', year: 2014, company: 'Tecmo Koei', image_id: 3},
        {name: 'Phoenix Wright: Ace Attorney', category_id: 2, genre: 'Visual Novel', year: 2001, company: 'Capcom', image_id: 4}
    ]
)


GamingSystem.delete_all
GamingSystem.reset_pk_sequence
GamingSystem.create!(
    [
        {platform_id: 1, game_id: 1},
        {platform_id: 1, game_id: 2},
        {platform_id: 1, game_id: 3},
        {platform_id: 2, game_id: 2},
        {platform_id: 2, game_id: 3},
        {platform_id: 4, game_id: 1},
        {platform_id: 6, game_id: 3},
        {platform_id: 3, game_id: 3},
        {platform_id: 8, game_id: 4},
        {platform_id: 6, game_id: 4},
        {platform_id: 6, game_id: 1}
    ]
)

User.find(1).games << Game.find(1)
User.find(2).games << Game.find(1)
User.find(3).games << Game.find(1)
User.find(4).games << Game.find(2)
User.find(4).games << Game.find(3)
User.find(5).games << Game.find(2)
User.find(6).games << Game.find(2)
User.find(6).games << Game.find(3)
