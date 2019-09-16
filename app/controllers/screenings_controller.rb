class ScreeningsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_screening, only: [:show, :edit, :update, :destroy, :join, :join_cancel]
  before_action :can_edit?, only: [:edit, :update, :destroy]

  # GET /screenings
  # GET /screenings.json
  def index
    @screenings = Screening.all

    respond_to :html, :json, :rss, :atom
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
        if request.params["is_tweet"] && !Rails.env.test?
          twitter_client.update!(t("view.screening.tweet.create", {
                                     title: @screening.title,
                                     url: screening_url(@screening),
                                   }))
        end
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

    if can_join? && @join_screening.save
      if !Rails.env.test? && request.params["is_tweet"]
        twitter_client.update!(t("view.screening.tweet.join", {
                                   title: @screening.title,
                                   url: screening_url(@screening),
                                 }))
      end
      redirect_to @screening, notice: "参加を表明しました"
    else
      render :show
    end
  end

  def join_cancel
    @cancel_screening = JoinScreening.find_by(screening: @screening, user: current_user)

    if can_join? && @cancel_screening.delete
      redirect_to @screening, notice: "参加表明を取り消しました"
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

  def can_edit?
    render "errors/403", status: 403 if @screening.manager != current_user
  end

  def can_join?
    @screening.manager != current_user &&
      @screening.showing_start > Date.current
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:key]
      config.consumer_secret = Rails.application.credentials.twitter[:secret]
      config.access_token = session["twitter_token"]
      config.access_token_secret = session["twitter_secret"]
    end
  end
end
