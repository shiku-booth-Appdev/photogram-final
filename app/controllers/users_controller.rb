class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)
    if @user.private == false
      render({ :template => "users/show.html.erb" })
    else
      redirect_to("/", { :alert => "You're not authorized for that."})
    end
  end

end