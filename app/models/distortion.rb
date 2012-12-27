class Distortion 
	include Mongoid::Document

	field :name, type: String
	attr_accessible :name
	
	embedded_in :thought, :inverse_of => :distortions

end
