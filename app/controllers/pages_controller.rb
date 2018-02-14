class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @not_container = true
  end

  def dashboard
  end
end
