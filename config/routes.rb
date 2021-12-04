Rails.application.routes.draw do
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
# rails generate draft:resource followrequest recipient_id:integer sender_id:integer status:string
# rails generate draft:resource like fan_id:integer photo_id:integer

# rails generate draft:account user comments_count:integer email:string likes_count:integer password_digest:string private:boolean username:string

