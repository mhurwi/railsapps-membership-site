class Feeling
	include Mongoid::Document
	#include Mongoid::ActsAsList

	field :name, type: String
	field :intensityBefore, type: Integer
	field :intensityAfter, type: Integer

	embedded_in :incident, :inverse_of => :feelings

end