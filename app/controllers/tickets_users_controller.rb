class TicketsUsersController < ApplicationController
  before_action :set_tickets_user, only: [:show, :edit, :update, :destroy]

  # GET /tickets_users
  # GET /tickets_users.json
  def index
    @order = params[:order]
    @tickets = current_user.tickets.order(@order).page params[:page]
  end

  # GET /tickets_users/1
  # GET /tickets_users/1.json
  def show
  end

  # GET /tickets_users/new
  def new
    @tickets_user = TicketsUser.new
  end

  # GET /tickets_users/1/edit
  def edit
  end

  # POST /tickets_users
  # POST /tickets_users.json
  def create
    @tickets_user = TicketsUser.create(ticket_id: params[:id], user_id: current_user.id)
    sport_sections = Ticket.find(params[:id]).sport_sections
    sport_sections.each do |section|
      sport_sections_user = SportSectionsUser.create(sport_section_id: section.id, user_id: current_user.id)
    end
    #binding.irb
    #current_user.sport_sections << Ticket.find(params[:id]).sport_sections
    #current_user.save!
  end

  # PATCH/PUT /tickets_users/1
  # PATCH/PUT /tickets_users/1.json
  def update
    respond_to do |format|
      if @tickets_user.update(tickets_user_params)
        format.html { redirect_to @tickets_user, notice: 'Tickets user was successfully updated.' }
        format.json { render :show, status: :ok, location: @tickets_user }
      else
        format.html { render :edit }
        format.json { render json: @tickets_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets_users/1
  # DELETE /tickets_users/1.json
  def destroy
    ticket_user = TicketsUser.find(params[:id])
    ticket_user.destroy
    redirect_to tickets_users_url
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
