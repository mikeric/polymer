class Pattern
  include DataMapper::Resource
  
  property :id,             Serial
  property :polyrhythm_id,  Integer,  :key => true
  property :time,           Integer,  :nullable => false
  property :body,           String,   :nullable => false
  
  belongs_to :polyrhythm
  
  validates_with_block do
    if body && time != nil
      body.length == time * 2
    end
  end
end