class TicketsController < ApplicationController
	before_action :ticket_params, only: [:create]
  def new
  	@ticket = Ticket.new
  end

  def create
  	@ticket = Ticket.new(ticket_params)
  	if @ticket.save
		redirect_to @ticket.paypal_url(ticket_path(@ticket), root_url)
	else
		redirect_to root_url alert: "did not save!"
	end
  end

  def show
  	@ticket = Ticket.find(params[:id])
  end

 protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @ticket = Ticket.find params[:invoice]
      @ticket.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end


  private
	def ticket_params
      params.require(:ticket).permit(:name)
    end
end
