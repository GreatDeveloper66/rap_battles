class TownsController < ApplicationController
  before_action :require_login
  def show
  end
  def index
    @towns = Town.all
  end
  def new
  end
  def edit
  end
  def create
  end
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
