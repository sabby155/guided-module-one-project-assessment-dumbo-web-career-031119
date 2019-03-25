# Add seed data here. Seed your database with `rake db:seed`

Artist.delete_all
Fan.delete_all
User.delete_all
Album.delete_all

eric = User.create(first_name: "Hyeok Jung", last_name: "Kim", user_name: "Eric_" )
sabrina  = User.create(first_name: "Sabrina", last_name: "Chow", user_name: "SabbyDoo" )
daniel = User.create(first_name: "Daniel", last_name: "Ko", user_name: "danko" )

jay_z = Artist.create(name: "Jay-Z")
chance = Artist.create(name: "Chance the Rapper")
j_cole = Artist.create(name: "J. Cole") 

good_ass_job = Album.create(name: "Good Ass Job", release_date: "April 7, 2019", released?: false, artist: jay_z)
hot_fyre = Album.create(name: "Hot Fyre", release_date: "November 15, 2019", released?: false, artist: chance)
forest_hills_dr = Album.create(name: "Forest Hills", release_date: "Feb 1, 2020", released?: false, artist: j_cole)


fan_1 = sabrina.create_fan(chance)
fan_2 = eric.create_fan(jay_z)
fan_3 = daniel.create_fan(j_cole)

