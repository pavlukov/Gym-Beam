class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  def index
    @order = params[:order]
    @tickets = Ticket.all.order(@order).page params[:page]
  end

  # GET /tickets/1
  def show
    @ticket = Ticket.find(params[:id])
    @new_comment = Comment.build_from(@ticket, current_user.id, '')
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket

    respond_to do |format|
      if @ticket.save
        if current_user.owner?
          TicketsUser.create(ticket_id: @ticket.id, user_id: current_user.id)
        end

        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tickets/1
  def update
    authorize @ticket

    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tickets/1
  def destroy
    authorize @ticket

    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:expire_date, :visits_remaining, :cost, :order, :sport_section_ids => [])
    end
end
