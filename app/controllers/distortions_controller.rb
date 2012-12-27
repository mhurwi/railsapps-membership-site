class DistortionsController < ApplicationController
  #before_filter :authenticate_user!
	
	def create
    incident = Incident.find(params[:incident_id])
		thought = incident.thoughts.where(:id => params[:thought_id]).last
		@distortion = thought.distortions.create!(params[:distortion])
    
    if @distortion.save
      flash[:notice] = "New distortion Added"
    else
      flash[:alert] = "Your distortion might have some errors, please check and try again."
    end

    respond_to do |format|
      format.js
    end
	end

  def edit
    @thought = Thought.find(params[:thought_id])
    @distortion = @thought.distortions.find(params[:id])
  end

  def update
    @thought = Thought.find(params[:thought_id])
    @distortion = @thought.distortions.find(params[:id])
    respond_to do |format|
      if @distortion.update_attributes(params[:distortion])
          format.html { redirect_to @thought, notice: 'Your thought was updated.' }
      else
        format.html {render action: "edit"}
      end
    end
  end

  def sort
    @distortions = Thought.distortion
    @distortions.each do |distortion|
      p distortion.position = params['distortion'].index(distortion.id.to_s) +1
      distortion.save
    end

    render :nothing => true
  end

  def destroy
    @thought = Thought.find(params[:thought_id])
    @distortion = @thought.distortions.find(params[:id])
    @distortion.destroy

    respond_to do |format|
     format.js
    end
  end

end

