class TicketsUsersController < ApplicationController
  before_action :set_tickets_user, only: [:show, :edit, :update, :destroy]

  # GET /tickets_users
  # GET /tickets_users.json
  def index
    @tickets_users = TicketsUser.all
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
    @tickets_user = TicketsUser.new(tickets_user_params)

    respond_to do |format|
      if @tickets_user.save
        format.html { redirect_to @tickets_user, notice: 'Tickets user was successfully created.' }
        format.json { render :show, status: :created, location: @tickets_user }
      else
        format.html { render :new }
        format.json { render json: @tickets_user.errors, status: :unprocessable_entity }
      end
    end
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
    @tickets_user.destroy
    respond_to do |format|
      format.html { redirect_to tickets_users_url, notice: 'Tickets user was successfully destroyed.' }
      format.json { head :no_content }
    end
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
