class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    #Spelling error change from toys to toy
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find(params[:id])
    toy.update(toy_params)
    #Added a json render
    render json: toy
  end

  def destroy
    toy = Toy.find(params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end