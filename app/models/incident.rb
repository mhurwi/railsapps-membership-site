class Incident
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Paranoia  # so that docs are not actually trashed 

  field :description, type: String

  
  embeds_many :feelings, cascade_callbacks: true
  embeds_many :thoughts
	accepts_nested_attributes_for :feelings , :autosave => true
	accepts_nested_attributes_for :thoughts, :autosave => true
  

  #field :_id, type: String, default: ->{ name.to_s.parameterize } # in case you want to change how Mongo Object IDs are assigned

#  attr_accessible :description, :feelings, :thoughts

  validates_presence_of :description




end
