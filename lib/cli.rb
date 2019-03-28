
class CommandLineInterface 
    def greet
        puts "Welcome to Next Drop - an app that quickly finds your fave Hip Hop artist's next album release date."
    end
    
    def sign_or_log_in_prompt       
        puts "Hey stranger. Would you like to sign-up or log-in? (S / L)"
        input = gets.chomp 
            
        if input == "S"
            user = User.sign_up
        elsif input == "L"
            user = User.log_in  
        else
            puts "Wrong selection. Let's try this again. . . =) "     
            user = sign_or_log_in_prompt
         end  
        user   
    end

    def run
        # user's greeting prompt
        greet

        # user's sign-in prompt
        user = sign_or_log_in_prompt
       
        
        # user's initial view all artists prompt
        user.view_artists_with_upcoming_albums
        

        # user's choose artist to fan prompt
        puts "Please choose an artist: "
        artistArg = gets.chomp 
        user.choose_artist_to_fan(artistArg)


        # user's select one more artist to fan prompt
        #would be nice for them to immediately see who they've fanned so far 
        puts "Would you like to choose another artist to fan at this time? (Y / N)"
        input = gets.chomp 
            if input == "Y"
                puts "Please choose an artist: "
                artistArg = gets.chomp 
                user.choose_artist_to_fan(artistArg)
            else 
                puts "No biggy!"    
            end 
        

        # user's fan view prompt 
        puts "Would you like to peep your fan info? (Y / N)"
        input = gets.chomp 
            if input == "Y"
                user.who_am_i_a_fan_of
            else 
                puts "No biggy!"    
            end 
           
            
        # user's view next album drops (based on fanmanship) prompt   
        puts "Ready to see when your artist's next albums are dropping? (Y / N)"
        input = gets.chomp 
            if input == "Y"
                user.get_next_album_drop_dates  
            else 
                 puts "No biggy!"    
            end  
        
            
        # user update 'listened-to' status prompt  
        puts "Which albums have you listened to? "
        puts "Please type 'ALBUM NAME' or 'NONE'"

                user.update_listened 
                user.reload    
                user.get_next_album_drop_dates 
                # user.update_listened
             
        

        # user's ability to un-fan prompt
        puts "Would you like to un-fan yourself from an artist? (Y / N)"
        input = gets.chomp

            if input == "Y"   
                puts "Cool. Please select the artist you want to un-fan!"
                artistArg = gets.chomp
                user.delete_fan(artistArg)
                user.reload 
                user.who_am_i_a_fan_of
            else 
                puts "No biggy! Have a great day."    
            end    

    end
end 


##### Wishlist #####

#validate a user's password
#recognize a slightly fuzzy username but correct password 
#allow an existing user or new user state to not have to choose a new artist everytime
#not enforce a journey on users
#user should see their saved album drops sorted by immed. upcoming dates
