class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    if @user.id != @current_user.id and @user.private == true
      redirect_to("/", { :alert => "You're not authorized for that."})
    elsif @user.id != @current_user.id and @user.private == false
      the_username = params.fetch("the_username")
      @user = User.where({ :username => the_username }).at(0) 
      @count_of_followers = Followrequest.where({ :recipient_id => @user.id , :status => "accepted"}).count()
      @count_of_following = Followrequest.where({ :sender_id => @user.id , :status => "accepted"}).count()
      render({ :template => "users/show_other_profile.html.erb" })
    else
      the_username = params.fetch("the_username")
      @user = User.where({ :username => the_username }).at(0) 
      @count_of_followers = Followrequest.where({ :recipient_id => @user.id , :status => "accepted"}).count()
      @count_of_following = Followrequest.where({ :sender_id => @user.id , :status => "accepted"}).count()
      @list_of_follow_requests = Followrequest.where({ :recipient_id => @user.id , :status => "pending"}).order({ :created_at => :asc })
      render({ :template => "users/show_self_profile.html.erb" })
    end
  end

end