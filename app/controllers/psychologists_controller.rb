class PsychologistsController < ApplicationController
  before_action :set_psychologist, only: %i[ show edit update destroy ]

  # GET /psychologists or /psychologists.json
  def index
    @psychologists = Psychologist.all
  end

  # GET /psychologists/1 or /psychologists/1.json
  def show
  end

  # GET /psychologists/new
  def new
    @psychologist = Psychologist.new
  end

  # GET /psychologists/1/edit
  def edit
  end

  # POST /psychologists or /psychologists.json
  def create
    @psychologist = Psychologist.new(psychologist_params)

    respond_to do |format|
      if @psychologist.save
        format.html { redirect_to psychologist_url(@psychologist), notice: "Psychologist was successfully created." }
        format.json { render :show, status: :created, location: @psychologist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @psychologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /psychologists/1 or /psychologists/1.json
  def update
    respond_to do |format|
      if @psychologist.update(psychologist_params)
        format.html { redirect_to psychologist_url(@psychologist), notice: "Psychologist was successfully updated." }
        format.json { render :show, status: :ok, location: @psychologist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @psychologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psychologists/1 or /psychologists/1.json
  def destroy
    @psychologist.destroy

    respond_to do |format|
      format.html { redirect_to psychologists_url, notice: "Psychologist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_psychologist
      @psychologist = Psychologist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def psychologist_params
      params.require(:psychologist).permit(:name)
    end
end
