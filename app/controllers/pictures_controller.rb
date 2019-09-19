class PicturesController < ApplicationController

  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        flash[:notice] = "投稿が完了しました"
        redirect_to pictures_path
      else
        render :new
      end
    end
  end

  def update
    if @picture.update(picture_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to pictures_path
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to pictures_path
  end

  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end

  private

    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:content, :image)
    end

end
