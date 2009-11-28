class Pattern
  include DataMapper::Resource
  
  property :id,             Serial
  property :polyrhythm_id,  Integer
  property :time,           String,   :nullable => false
  property :resolution,     Integer,  :default => 16
  property :body,           String,   :nullable => false
  
  belongs_to :polyrhythm
  
  validates_with_block do
    body.length == length
  end
  
  def length
    t = time.split(/\//).map{|n| n.to_i}
    t[0] * (resolution / t[1])
  end
end