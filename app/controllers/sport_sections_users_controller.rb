class SportSectionsUsersController < ApplicationController
  before_action :set_sport_sections_user, only: [:show, :edit, :update, :destroy]

  # GET /sport_sections_users
  def index
    @sport_sections_users = SportSectionsUser.all
  end

  # GET /sport_sections_users/1
  def show
  end

  # GET /sport_sections_users/new
  def new
    @sport_sections_user = SportSectionsUser.new
  end

  # GET /sport_sections_users/1/edit
  def edit
  end

  # POST /sport_sections_users
  def create
    @sport_sections_user = SportSectionsUser.new(sport_sections_user_params)

    if @sport_sections_user.save
      redirect_to @sport_sections_user, notice: 'Sport sections user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sport_sections_users/1
  def update
    if @sport_sections_user.update(sport_sections_user_params)
      redirect_to @sport_sections_user, notice: 'Sport sections user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sport_sections_users/1
  def destroy
    @sport_sections_user.destroy
    redirect_to sport_sections_users_url, notice: 'Sport sections user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport_sections_user
      @sport_sections_user = SportSectionsUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sport_sections_user_params
      params.fetch(:sport_sections_user, {})
    end
end
