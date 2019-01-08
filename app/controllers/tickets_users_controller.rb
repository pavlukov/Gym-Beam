class TicketsUsersController < ApplicationController
  before_action :set_tickets_user, only: [:show, :edit, :update, :destroy]

  # GET /tickets_users
  def index
    @desc = params[:desc]
    @order = params[:order]
    if @desc
      @tickets = current_user.tickets.order("#{@order} DESC").page params[:page]
    else
      @tickets = current_user.tickets.order(@order).page params[:page]
    end
  end

  # GET /tickets_users/new
  def new
    @tickets_user = TicketsUser.new
  end

  # POST /tickets_users
  def create
    @tickets_user = TicketsUser.new(ticket_id: params[:id], user_id: current_user.id)
    authorize @tickets_user

    if @tickets_user.save
      sport_sections = Ticket.find(params[:id]).sport_sections
      sport_sections.each do |section|
        sport_sections_user = SportSectionsUser.create(sport_section_id: section.id, user_id: current_user.id)
      end
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /tickets_users/1
  def destroy
    ticket_user = TicketsUser.find(params[:id])
    authorize ticket_user

    ticket_user.ticket.sport_sections.to_a.each do |section|
      sport_sections_user = SportSectionsUser.where(user_id: current_user.id, sport_section_id: section.id)
      sport_sections_user.destroy(sport_sections_user.to_a.first.id)
    end
    ticket_user.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tickets_user
      @tickets_user = TicketsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tickets_user_params
      params.fetch(:tickets_user, {})

    end
end
