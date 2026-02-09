class TopController < ApplicationController
  def index
    @newdate = Newdate.all
  end
  
  def new
    @newdate = Newdate.new
  end

  def create
    @newdate = Newdate.new(params.require(:newdate).permit(:title, :startday, :endday, :allday, :memo))
    if @newdate.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to top_index_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @newdate = Newdate.find_by(id: params[:id])
  end

  def edit
    @newdate = Newdate.find_by(id: params[:id])
  end

  def update
    @newdate = Newdate.find_by(id: params[:id])
    if @newdate.update(params.require(:newdate).permit(:title, :startday, :allday, :endday, :memo))
      flash[:notice] = "「#{@newdate.id}」の情報を更新しました"
      redirect_to top_index_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @newdate = Newdate.find_by(id: params[:id])
    @newdate.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to top_index_path
  end
end
