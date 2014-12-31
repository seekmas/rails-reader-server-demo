class PostersController < ApplicationController
  before_action :set_poster, only: [:show, :edit, :update, :destroy]

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
