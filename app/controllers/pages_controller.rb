class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def dashboard
  end
end
