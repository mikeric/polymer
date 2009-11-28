class Pattern
  include DataMapper::Resource
  
  property :id,             Serial
  property :polyrhythm_id,  Integer
  property :time,           Integer,  :nullable => false
  property :resolution,     Integer,  :default => 16
  property :body,           String,   :nullable => false
  
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