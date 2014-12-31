class PostersController < ApplicationController
  before_action :set_poster, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit,:update,:destroy]
  
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
  end

  def index
    @posters = Poster.all
  end

  def show
      @poster.click = 0 if @poster.click == nil
      @poster.update(click: @poster.click+1)
  end

  def new
    @poster = Poster.new
  end

  def edit
  end

  def create
    @poster = Poster.new(poster_params)
    @poster.save
  end

  def update
    @poster.update(poster_params)
    respond_to do |format|
        if @poster.update(poster_params)
            format.html { redirect_to @poster, notice: 'Poster was successfully updated.' }
            format.json { render :show, status: :ok, location: @poster }
        else
            format.html { render :edit }
            format.json { render json: @poster.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @poster.destroy
    respond_to do |format|
        format.html { redirect_to customers_url, notice: 'Poster was successfully destroyed.' }
        format.json { head :no_content }
    end
  end

  private
    def set_poster
      @poster = Poster.find(params[:id])
    end

    def poster_params
      params.require(:poster).permit(:subject, :content, :click, :author_id , :cover)
    end
end
