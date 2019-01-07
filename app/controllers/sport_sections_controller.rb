class SportSectionsController < ApplicationController
  before_action :set_sport_section, only: [:show, :edit, :update, :destroy]

  # GET /sport_sections
  def index
    @order = params[:order]
    if params[:tag]
      @sport_sections = SportSection.tagged_with(params[:tag]).order(@order).page params[:page]
    else
      @sport_sections = SportSection.all.order(@order).page params[:page]
    end
  end

  # GET /sport_sections/1
  def show
    @sport_section = SportSection.find(params[:id])
    @new_comment = Comment.build_from(@sport_section, current_user.id, '')
  end

  # GET /sport_sections/new
  def new
    @sport_section = SportSection.new
  end

  # POST /sport_sections
  def create
    @sport_section = SportSection.new(sport_section_params)
    authorize @sport_section

    respond_to do |format|
      if @sport_section.save
        if current_user.owner?
          SportSectionsUser.create(sport_section_id: @sport_section.id, user_id: current_user.id)
        end

        format.html { redirect_to @sport_section, notice: 'Sport section was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sport_sections/1
  def update
    authorize @sport_section

    respond_to do |format|
      if @sport_section.update(sport_section_params)
        format.html { redirect_to @sport_section, notice: 'Sport section was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /sport_sections/1
  def destroy
    authorize @sport_section

    @sport_section.destroy
    respond_to do |format|
      format.html { redirect_to sport_sections_url, notice: 'Sport section was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport_section
      @sport_section = SportSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sport_section_params
      params.require(:sport_section).permit(:name, :coach_name, :description, :address, :tag_list, :order)
    end
end
