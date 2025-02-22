Rails.application.routes.draw do
  
  # Home
  get("/", { :controller => "users", :action => "index" }) 

  # READ
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:the_username", {:controller => "users", :action => "show"})
  get("/users/:the_username/feed", {:controller => "users", :action => "show_feed"})
  
  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Followrequest resource:

  # CREATE
  post("/insert_followrequest", { :controller => "followrequests", :action => "create" })
          
  # READ
  get("/followrequests", { :controller => "followrequests", :action => "index" })
  
  get("/followrequests/:path_id", { :controller => "followrequests", :action => "show" })
  
  # UPDATE
  
  post("/modify_followrequest/:path_id", { :controller => "followrequests", :action => "update" })
  
  # DELETE
  get("/delete_followrequest/:path_id", { :controller => "followrequests", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



# rails generate draft:resource photo caption:text comments_count:integer image:string likes_count:integer owner_id:integer
# rails generate draft:resource comment author_id:integer body:text photo_id:integer
# rails generate draft:resource followRequest recipient_id:integer sender_id:integer status:string
# rails generate draft:model follow_request recipient_id:integer sender_id:integer status:string
# rails generate draft:resource like fan_id:integer photo_id:integer

# rails generate draft:account user comments_count:integer email:string likes_count:integer password_digest:string private:boolean username:string

