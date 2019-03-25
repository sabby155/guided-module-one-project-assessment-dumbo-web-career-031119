class User < ActiveRecord::Base 
    has_many :fans
    has_many :artists, through: :fans    
   

    #displays a user's full name 
    def full_name 
        # user = User.find_by(id: id)
        "#{first_name} #{last_name}" 
    end  
        
    def view_artists_with_upcoming_albums
        Artist.all.map do |artist|
            artist.name
        end      
    end    

    def choose_artist_to_fan(artistArg)
        Artist.all.select do |artist|
            if artistArg == artist.name
                self.create_fan(artist)
            end     
        end     
    end     

    def get_my_fan_data
        my_fan_data = Fan.all.select do |fan|
            fan.user_id == self.id 
        end  
        my_fan_data       
    end   
    
    def get_next_album_drops
        fan_data = get_my_fan_data
        my_artist_ids = fan_data.map do |data|
            data.artist_id
        end.uniq   
        albums = Album.all.select do |album|
          my_artist_ids.include?(album.artist_id)   
        end  
        albums      
    end     
    #private methods --- 

    def create_fan(artist)
        Fan.create(artist: artist,  user: self) 
    end  

end     

