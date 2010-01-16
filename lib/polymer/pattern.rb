module Polymer
  class Pattern
    include DataMapper::Resource
    
    property :id,             Serial
    property :polyrhythm_id,  Integer
    property :time,           Integer,  :required => true
    property :resolution,     Integer,  :default => 16
    property :body,           String,   :required => true
    
    belongs_to :polyrhythm
    
    validates_with_block do
      body.length % beats == 0
    end
    
    def beats
      body.length / (resolution / time)
    end
    
    def time_signature
      "#{beats}/#{time}"
    end
  end
end