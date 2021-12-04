Rails.application.routes.draw do
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

