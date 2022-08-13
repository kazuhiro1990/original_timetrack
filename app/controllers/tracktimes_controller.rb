class TracktimesController < ApplicationController
  def index
    @tracktimes = Tracktime.all
  end

  #def new
  #end

  def create
     @tracktime = Tracktime.new(tracktime_params)
    if @tracktime.save
      flash[:success] = '記録を開始しました'
      redirect_to root_url
    else
      flash.now[:danger] = '  記録に失敗しました。'
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @tracktime.destroy
    flash[:success] = '記録を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def tracktime_params
    params.permit(:description,:start_time)
  end
  
end
