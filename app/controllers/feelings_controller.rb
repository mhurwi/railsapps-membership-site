class FeelingsController < ApplicationController
  #before_filter :authenticate_user!
	
	def create
		@incident = Incident.find(params[:incident_id])
		@feeling = @incident.feelings.create!(params[:feeling])
    
    if @feeling.save
      flash[:notice] = "New feeling Added"
    else
      flash[:alert] = "Your feeling might have some errors, please check and try again."
    end

    respond_to do |format|
      format.js
    end
	end

  def edit
    @incident = Incident.find(params[:incident_id])
    @feeling = @incident.feelings.find(params[:id])
  end

  def update
    @incident = Incident.find(params[:incident_id])
    @feeling = @incident.feelings.find(params[:id])
    respond_to do |format|
      if @feeling.update_attributes(params[:feeling])
          format.html { redirect_to @incident, notice: 'Your incident was updated.' }
      else
        format.html {render action: "edit"}
      end
    end
  end

  def sort
    @feelings = Incident.feeling
    @feelings.each do |feeling|
      p feeling.position = params['feeling'].index(feeling.id.to_s) +1
      feeling.save
    end

    render :nothing => true
  end

  def destroy
    @incident = Incident.find(params[:incident_id])
    @feeling = @incident.feelings.find(params[:id])
    @feeling.destroy

    respond_to do |format|
     format.js
    end
  end

end

