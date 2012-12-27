class Thought 
	include Mongoid::Document

	field :thought, type: String
	field :distortions, type: Array
	field :rationalThought, type: String

	embedded_in :incident, :inverse_of => :thoughts

	embeds_many :distortions

	accepts_nested_attributes_for :distortions, :autosave => true

	
end