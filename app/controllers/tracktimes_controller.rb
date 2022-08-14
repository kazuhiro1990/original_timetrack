class TracktimesController < ApplicationController
  def index
    @tracktimes = Tracktime.all
    @tracking = session[:tracking]
   # @tracking=false
  end

  #計測開始
  def trackstart
      session[:description]=params[:description]
      session[:start_time]=params[:start_time]
      session[:end_time]=params[:end_time]
      @tracktime = Tracktime.new(tracktime_params)
      @tracktime.save
      session[:tracking]  = true
      @tracking = session[:tracking]
      redirect_to root_url
  end

  #計測終了
  def create
      @tracktime=Tracktime.order(updated_at: :desc).limit(1)
      if @tracktime.update(tracktime_params)
        flash[:success] = '記録しました。'
        session[:tracking]  = false
        @tracking = session[:tracking]
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
    params.permit(:description,:start_time,:end_time)
  end
  
end
