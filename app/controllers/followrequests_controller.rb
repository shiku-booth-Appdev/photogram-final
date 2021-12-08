class FollowrequestsController < ApplicationController
  def index
    matching_followrequests = FollowRequest.all

    @list_of_followrequests = matching_followrequests.order({ :created_at => :desc })

    render({ :template => "followrequests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_followrequests = FollowRequest.where({ :id => the_id })

    @the_followrequest = matching_followrequests.at(0)

    render({ :template => "followrequests/show.html.erb" })
  end

  def create
    the_followrequest = FollowRequest.new
    the_followrequest.recipient_id = params.fetch("query_recipient_id")
    the_followrequest.sender_id = params.fetch("query_sender_id")
    the_followrequest.status = params.fetch("query_status")

    recipient = User.where({ :id => the_followrequest.recipient_id }).at(0)
    sender = User.where({ :id => the_followrequest.sender_id }).at(0)

    if the_followrequest.valid?
      if recipient.private == false
        the_followrequest.status = "accepted"
        the_followrequest.save
        redirect_to("/users/#{recipient.username}", { :notice => "Followrequest created successfully." })
      else
        the_followrequest.status = "pending"
        the_followrequest.save
        redirect_to("/users/#{recipient.username}", { :notice => "Followrequest created successfully." })
      end
    else
        redirect_to("/users/#{recipient.username}", { :notice => "Followrequest failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_followrequest = FollowRequest.where({ :id => the_id }).at(0)

    the_followrequest.recipient_id = params.fetch("query_recipient_id")
    the_followrequest.sender_id = params.fetch("query_sender_id")
    the_followrequest.status = params.fetch("query_status")

    recipient = User.where({ :id => the_followrequest.recipient_id }).at(0)
    sender = User.where({ :id => the_followrequest.sender_id }).at(0)

    if the_followrequest.valid?
      the_followrequest.save
      redirect_to("/users/#{recipient.username}", { :notice => "Followrequest updated successfully."} )
    else
      redirect_to("/users/#{recipient.username}", { :alert => "Followrequest failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_followrequest = FollowRequest.where({ :id => the_id }).at(0)
    recipient = User.where({ :id => the_followrequest.recipient_id }).at(0)
    sender = User.where({ :id => the_followrequest.sender_id }).at(0)
    the_followrequest.destroy

    redirect_to("/users/#{recipient.username}", { :notice => "Followrequest deleted successfully."} )
  end
end
