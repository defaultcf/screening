class ScreeningsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_screening, only: [:show, :edit, :update, :destroy, :join]
  before_action :can_edit, only: [:edit, :update, :destroy]

  # GET /screenings
  # GET /screenings.json
  def index
    @screenings = Screening.where("showing_start >= ?", Time.current)
  end

  # GET /screenings/1
  # GET /screenings/1.json
  def show
  end

  # GET /screenings/new
  def new
    @screening = Screening.new
  end

  # GET /screenings/1/edit
  def edit
  end

  # POST /screenings
  # POST /screenings.json
  def create
    @screening = Screening.new(screening_params)
    @screening.manager = current_user

    respond_to do |format|
      if @screening.save
        format.html { redirect_to @screening, notice: "Screening was successfully created." }
        format.json { render :show, status: :created, location: @screening }
      else
        format.html { render :new }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screenings/1
  # PATCH/PUT /screenings/1.json
  def update
    respond_to do |format|
      if @screening.update(screening_params)
        format.html { redirect_to @screening, notice: "Screening was successfully updated." }
        format.json { render :show, status: :ok, location: @screening }
      else
        format.html { render :edit }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screenings/1
  # DELETE /screenings/1.json
  def destroy
    @screening.destroy!
    respond_to do |format|
      format.html { redirect_to screenings_url, notice: "Screening was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /screenings/1/join
  def join
    @join_screening = JoinScreening.new(screening: @screening, user: current_user, message: request.params["message"])

    if @screening.manager != current_user && @join_screening.save
      redirect_to @screening, notice: "参加を表明しました"
    else
      render :show
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_screening
      @screening = Screening.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screening_params
      params.require(:screening).permit(:title, :body, :showing_start)
    end

    def can_edit
      render "errors/403", status: 403 if @screening.manager != current_user
    end
end
