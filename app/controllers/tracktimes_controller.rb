class TracktimesController < ApplicationController
  def index
    @tracktimes = Tracktime.order(id: :desc)
    @tracking = session[:tracking]
    @newtracktime = Tracktime.new
    @endtracktime=Tracktime.find_by(id: session[:id])
    @projects=Project.all
   # @tracking=false
  end

  #計測開始
  def trackstart
      @tracktime = Tracktime.new(newtracktime_params)
      @tracktime[:start_time]= Time.zone.now
      session[:start_time]=@tracktime.start_time
      session[:project_id]= @tracktime.project_id
      @tracktime.save
      session[:id]=@tracktime.id
      session[:tracking]  = true
      @tracking = session[:tracking]
      session[:description]=@tracktime[:description]
      redirect_to root_url
      #byebug
  end

  #計測終了
  def trackend
      @tracktime=Tracktime.find_by(id: session[:id])
      @tracktime.update(end_time: Time.zone.now)
      @duration=@tracktime[:end_time]-@tracktime[:start_time]
      @tracktime.duration=@duration
      @tracktime.save!
      
      
      if @tracktime.update(endtracktime_params)
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
    @tracktime=Tracktime.find(params[:id])
  end

  def update
    @tracktime=Tracktime.find(params[:id])
    if @tracktime.update(tracktime_params)
        flash[:success] = '記録しました。'
        @duration=@tracktime[:end_time]-@tracktime[:start_time]
        @tracktime.duration=@tracktime[:end_time]-@tracktime[:start_time]
        @tracktime.save
        redirect_to root_url
       # byebug
    else
       flash.now[:danger] = '  記録に失敗しました。'
       render :index    
    end
  end

  def destroy
    @tracktime=Tracktime.find(params[:id])
    @tracktime.destroy
    flash[:success] = '記録を削除しました。'
    redirect_to root_url
  end
  
  private
  
  def tracktime_params
    params.require(:tracktime).permit(:description, :start_time, :end_time)
  end
  
  def newtracktime_params
    params.require(:tracktime).permit(:description, :project_id)
  end
  
  def endtracktime_params
    params.permit(:description,:start_time)
  end
  
end
