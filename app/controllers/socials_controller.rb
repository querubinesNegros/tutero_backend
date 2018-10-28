class SocialsController < ApplicationController
  #poner en routes la siguiente ruta
  # resources :socials
  # agregar en el modelo    scope :search, ->(params){where(email: params)}

  before_action :set_user, only: [:show]

  def index
    @user = User.search("paila@hola.com")[0]
    render json: @user
  end

  def create
    @user = User.search(params["email"])[0]

    if @user == nil
      render json: @user.errors, status: :unprocessable_entity
    else
      knock_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: knock_token
    end
  end
end
