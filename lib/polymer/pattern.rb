module Polymer
  class Pattern
    include MongoMapper::EmbeddedDocument
    
    key :resolution,  Integer,  :required => true, :default => 16
    key :time,        Integer,  :required => true
    key :body,        String,   :required => true
    
    validate :body_length
    
    def beats
      body.length / (resolution / time)
    end
    
    def time_signature
      "#{beats}/#{time}"
    end
    
    private
    
    def body_length
      if body.length % (resolution / time) != 0
        errors.add(:body, "must be devisible by the beat resolution")
      end
    end
  end
end