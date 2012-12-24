class Thought 
	include Mongoid::Document

	field :thought, type: String
	field :distortions, type: Array
	field :rationalThought, type: String

	embedded_in :incident, :inverse_of => :thoughts

end