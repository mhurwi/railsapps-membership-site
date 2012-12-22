class Feeling
	include Mongoid::Document

	field :name, type: String
	field :intensityBefore, type: Integer
	field :intensityAfter, type: Integer

	embedded_in :incident



end