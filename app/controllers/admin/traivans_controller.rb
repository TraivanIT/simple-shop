class Admin::TraivansController < Admin::ApplicationController
  def index
    @traivans = Traivan.all
  end

  def edit
    @traivan = Traivan.find(params[:id])
  end

  def update
    @traivan = Traivan.find(params[:id])
    if @traivan.update(traivan_params)
      redirect_to admin_traivans_path, notice: 'Admin was success full updated'
    else
      flash[:alert] = 'There was problem updated'
      render :edit
    end 
  end

  private
    def traivan_params
      params.require(:traivan).permit(:fullname, :username, :password)
    end
end
