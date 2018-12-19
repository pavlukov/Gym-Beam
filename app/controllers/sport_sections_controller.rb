class SportSectionsController < ApplicationController
  before_action :set_sport_section, only: [:show, :edit, :update, :destroy]

  # GET /sport_sections
  # GET /sport_sections.json
  def index
    @sport_sections = SportSection.all
  end

  # GET /sport_sections/1
  # GET /sport_sections/1.json
  def show
  end

  # GET /sport_sections/new
  def new
    @sport_section = SportSection.new
  end

  # GET /sport_sections/1/edit
  def edit
  end

  # POST /sport_sections
  # POST /sport_sections.json
  def create
    @sport_section = SportSection.new(sport_section_params)

    respond_to do |format|
      if @sport_section.save
        format.html { redirect_to @sport_section, notice: 'Sport section was successfully created.' }
        format.json { render :show, status: :created, location: @sport_section }
      else
        format.html { render :new }
        format.json { render json: @sport_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sport_sections/1
  # PATCH/PUT /sport_sections/1.json
  def update
    respond_to do |format|
      if @sport_section.update(sport_section_params)
        format.html { redirect_to @sport_section, notice: 'Sport section was successfully updated.' }
        format.json { render :show, status: :ok, location: @sport_section }
      else
        format.html { render :edit }
        format.json { render json: @sport_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sport_sections/1
  # DELETE /sport_sections/1.json
  def destroy
    @sport_section.destroy
    respond_to do |format|
      format.html { redirect_to sport_sections_url, notice: 'Sport section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport_section
      @sport_section = SportSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sport_section_params
      params.require(:sport_section).permit(:name, :coach_name, :description)
    end
end
