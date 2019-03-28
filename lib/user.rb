class User < ActiveRecord::Base 
    has_many :fans
    has_many :artists, through: :fans    
    has_many :albums, through: :artists

    #displays a user's full name 
    def full_name
        # user = User.find_by(id: id)
        "#{first_name} #{last_name}!" 
    end  


    def self.sign_up
        puts "Please enter your username: "
        user_name = gets.chomp

        puts "Please enter your password: "
        password = gets.chomp

        puts "Please enter your first name: "
        first_name = gets.chomp

        puts "Awesome. Now, lease enter your last name: "
        last_name = gets.chomp

        user = User.create(first_name: first_name, last_name: last_name, user_name: user_name, password: password)
        puts "Welcome to the club #{user.full_name}"
        user
    end  

    def self.log_in 
        puts "Please enter your username: "
        user_name = gets.chomp

        puts "Please enter your password: "
        password = gets.chomp

        if User.exists?(user_name: user_name, password: password)
            user = User.find_by(password: password)    
            puts "Looks like you're already a member, #{user.full_name}. Dope."
            return user
        else 
            puts "We could not find you! Please sign-up stranger."
            sign_up   
        end 
    end   
    
   
        
    # displays a list of artists that have upcoming album drops
    def view_artists_with_upcoming_albums
        puts "Here is a list of Hip Hop's most anticipated upcoming albums this year:"
        artists = Artist.all.map do |artist|
            artist.name
        end 
        puts artists
    end    


    #allows a user to select a given artist to save (fanmanship)
    def choose_artist_to_fan(artistArg)
        Artist.all.each do |artist|
            unless self.artists.exists?(id: artist.id)
                if artistArg == artist.name 
                self.create_fan(artist)    
                end 
               "You might already be a fan." 
            end     
        end 
        puts "You are now a fan of #{artistArg}. Sweet!"    
    end    
    

    #get back all of their fan data 
    def get_my_fan_info 
        puts "Here is your fan info: "
        self.fans
    end    
    
    #see which artists they are already fans-of 
    def who_am_i_a_fan_of
        names = self.artists.map do |artist|
            artist.name
        end
        names = names.uniq
        puts "You, my friend, are currently a fan of: #{names}"
    end     

      
    #retrieve their next album drop info (based on fanmanship)
      def get_next_album_drop_dates
        self.fans.each do |fan|
            album = Album.find_by(artist_id: fan.artist_id)
            artist = Artist.find_by(id: fan.artist_id)
                if fan.listened_to == true
                    listenedStatus = "Heard"
                else 
                    listenedStatus = "Haven't Heard"
                end
            puts " #{artist.name} - #{album.name} - #{album.release_date} - #{listenedStatus} "
       end
    end


    
    #update listened-to status
    def update_listened
        input = gets.chomp

        if input != "NONE"
            album = Album.find_by(name: input)
            artistId = album.artist_id
            fan_card = self.fans.find_by(artist_id: artistId)
            fan_card.update(listened_to: true)
            puts "** Your status for #{album.name} has been changed to listened. YA HERD? **"
        else 
            puts "No biggy!"  
        end  
       
    end  
    
      
    #delete fan-card 
    def delete_fan(artistArg) 
        Artist.all.each do |artist|
            if artistArg == artist.name
               self.destroy_fan(artist) 
            end    
        end
        puts "You're no longer a fan!"     
    end  



    def create_fan(artist)
        Fan.create(artist: artist,  user: self) 
    end  
    

    def destroy_fan(artist)
        fan_card = Fan.find_by(artist: artist, user: self)
        fan_card.destroy
    end   
  

end     