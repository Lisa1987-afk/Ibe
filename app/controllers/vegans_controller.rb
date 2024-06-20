class VegansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @vegans = Vegan.all
    @vegans = Vegan.order(overall: :desc)
    if params[:search] == nil
      @vegans= Vegan.all
    elsif params[:search] == ''
      @vegans= Vegan.all
    else
      @vegans = Vegan.where("name LIKE ? OR genre LIKE ? OR price LIKE ? OR address LIKE ? OR about LIKE ?", 
                    "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  def new
    @vegan = Vegan.new
  end

  def create
    vegan = Vegan.new(vegan_params)
    vegan.user_id = current_user.id

    if vegan.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def show
    @vegan = Vegan.find(params[:id])
    @comments = @vegan.comments
    @comment = Comment.new
  end

  def edit
    @vegan = Vegan.find(params[:id])
  end

  def update
    vegan = Vegan.find(params[:id])
    if vegan.update(vegan_params)
      redirect_to action: "show", id: vegan.id
    else
      redirect_to action: "new"
    end
  end
  
  def destroy
    vegan = Vegan.find(params[:id])
    vegan.destroy
    redirect_to action: :index
  end

  def vegan_info
    @vegan_description = "ヴィーガンは、動物製品を摂取せず、動物を利用しないライフスタイルを追求する人々のことを指します。"
    @vegan_image = "vegan_image.jpg"
    render 'vegan_info' # vegan_info.html.erb を表示
  end

  private

  def vegan_params
    params.require(:vegan).permit(:name, :genre, :price, :address, :about, :image_top, :overall, images: [])
  end
end
