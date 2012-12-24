class ThoughtsController < ApplicationController
  #before_filter :authenticate_user!
	
	def create
		@incident = Incident.find(params[:incident_id])
		@thought = @incident.thoughts.create!(params[:thought])
    
    if @thought.save
      flash[:notice] = "New thought Added"
    else
      flash[:alert] = "Your thought might have some errors, please check and try again."
    end

    respond_to do |format|
      format.js
    end
	end

  def edit
    @incident = Incident.find(params[:incident_id])
    @thought = @incident.thoughts.find(params[:id])
  end

  def update
    @incident = Incident.find(params[:incident_id])
    @thought = @incident.thoughts.find(params[:id])
    respond_to do |format|
      if @thought.update_attributes(params[:thought])
          format.html { redirect_to @incident, notice: 'Your incident was updated.' }
      else
        format.html {render action: "edit"}
      end
    end
  end

  def sort
    @thoughts = Incident.thought
    @thoughts.each do |thought|
      p thought.position = params['thought'].index(thought.id.to_s) +1
      thought.save
    end

    render :nothing => true
  end

  def destroy
    @incident = Incident.find(params[:incident_id])
    @thought = @incident.thoughts.find(params[:id])
    @thought.destroy

    respond_to do |format|
     format.js
    end
  end

end

