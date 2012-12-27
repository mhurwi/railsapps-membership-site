class Distortion 
	include Mongoid::Document

	field :name, type: String

	embedded_in :thought, :inverse_of => :distortions

end
