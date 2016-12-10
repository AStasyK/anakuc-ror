User.delete_all
User.reset_pk_sequence #with gem reset sequence
User.create(
    [
        {name: 'Sullivan', email: 'sully@gmail.com', password: "a0411cdc8fa047d73aaa559cb0d294ee"},
        {name: 'Nathan Drake', email: 'treasure-hunter@gmail.com', password: "d7515ad71ed2fd3f622a290cbd737c21"},
        {name: 'Elena Fisher', email: 'efisher@gmail.com', password: "2163c17ca50bb0fcd227460c4f682a40"},
        {name: 'Yukimura Sanada', email: 'ysanada@gmail.com', password: "2853317c4abbac70528b177856a1f100"},
        {name: 'Shingen Takeda', email: 'tigerofkai@gmail.com', password: "42ce2f91530a3e22f4112ac9c069de75"},
        {name: 'Sasuke Sarutobi', email: 'shinobi@gmail.com', password: "37fc2767ab1c4826c736f1fced9a4ae7"}
    ]
)

Relationship.delete_all
Relationship.reset_pk_sequence
Relationship.create(
    [
        {user_id: 1, follower_id: 2},
        {user_id: 2, follower_id: 3},
        {user_id: 3, follower_id: 2},
        {user_id: 4, follower_id: 6},
        {user_id: 5, follower_id: 4}
    ]
)

Category.delete_all
Category.reset_pk_sequence
Category.create(
    [
        {name: 'Platforms'},
        {name: 'Games'},
        {name: 'Books'},
        {name: 'Movies'}
    ]
)

Favourite.delete_all
Favourite.reset_pk_sequence
Favourite.create(
    [
        {user_id: 1, game_id: 1},
        {user_id: 2, game_id: 1},
        {user_id: 3, game_id: 1},
        {user_id: 4, game_id: 2},
        {user_id: 4, game_id: 3},
        {user_id: 5, game_id: 2},
        {user_id: 5, game_id: 4},
        {user_id: 6, game_id: 2},
        {user_id: 6, game_id: 3}
    ]
)

Platform.delete_all
Platform.reset_pk_sequence
Platform.create(
    [
        {family: 'PlayStation', name: 'PlayStation3', category_id: 1},
        {family: 'PlayStation', name: 'PlayStation4', category_id: 1},
        {family: 'PlayStation', name: 'PlayStation Vita', category_id: 1},
        {family: 'XBox', name: 'XBox 360', category_id: 1},
        {family: 'XBox', name: 'XBox One', category_id: 1},
        {family: 'PC', name: 'Microsoft Windows', category_id: 1},
        {family: 'PC', name: 'Mac OS', category_id: 1},
        {family: 'Nintendo', name: 'Nintendo DS', category_id: 1},
        {family: 'Nintendo', name: 'Nintendo 3DS', category_id: 1}
    ]
)

Game.delete_all
Game.reset_pk_sequence
Game.create(
    [
        {name: 'Uncharted: Drake’s Fortune', category_id: 2, genre: 'Action-adventure', year: 2007, company: 'Naughty Dog'},
        {name: 'Sengoku Basara 4', category_id: 2, genre: 'Hack and slash', year: 2014, company: 'Capcom'},
        {name: 'Samurai Warriors 4', category_id: 2, genre: 'Hack and slash', year: 2014, company: 'Tecmo Koei'},
        {name: 'Phoenix Wright: Ace Attorney', category_id: 2, genre: 'Visual Novel', year: 2001, company: 'Capcom'},
    ]
)


GamingSystem.delete_all
GamingSystem.reset_pk_sequence
GamingSystem.create(
    [
        {platform_id: 1, game_id: 1},
        {platform_id: 1, game_id: 2},
        {platform_id: 1, game_id: 3},
        {platform_id: 2, game_id: 1},
        {platform_id: 2, game_id: 2},
        {platform_id: 2, game_id: 3},
        {platform_id: 6, game_id: 3},
        {platform_id: 3, game_id: 3},
        {platform_id: 8, game_id: 4},
        {platform_id: 6, game_id: 4}
    ]
)
