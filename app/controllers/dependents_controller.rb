class DependentsController < ApplicationController
  def index
    @dependents = Dependent.all
    render json: @dependents
  end

  def create
    debugger
  end

  def new
    debugger
    @dependent = Dependent.new
  end
end
