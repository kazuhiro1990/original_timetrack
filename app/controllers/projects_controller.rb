class ProjectsController < ApplicationController
  def index
    @projects=Project.all
  end

 # def show
 # end

 # def new
 # end

  def create
    @project=Project.new(project_params)
    
    if @project.save
       flash[:success] = 'Project が正常に投稿されました'
      redirect_to projects_path
    else
      flash.now[:danger] = 'Project が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    def project_params
      params.permit(:name)
    end
end
