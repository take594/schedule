class MydaysController < ApplicationController
  def index
    @mydays = Myday.all
    @mydays_total = Myday.all.count
  end

  def new
    @myday = Myday.new
  end

  def create
    @myday = Myday.new(params.require(:myday).permit(:title, :start_day, :end_day, :allday, :memo))
    if @myday.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to :mydays      
    else
      flash[:notice] = "予定の登録に失敗しました"
      render "new"
    end
  end

  def show
    @myday = Myday.find(params[:id])
  end

  def edit
    @myday = Myday.find(params[:id])
  end

  def update
    @myday = Myday.find(params[:id])
    if @myday.update(params.require(:myday).permit(:title, :start_day, :end_day, :allday, :memo))
      flash[:notice] = "予定IDが「#{@myday.id}」の情報を更新しました"
      redirect_to :myday
    else
      flash[:notice] = "予定の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @myday = Myday.find(params[:id])
    @myday.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :mydays
  end
end
