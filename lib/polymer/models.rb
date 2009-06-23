class Polyrhythm
  include DataMapper::Resource
  
  property :id, Serial
  has n, :patterns
  
  def make
    transaction do |trans|
      trans.rollback unless save
      patterns.each do |pattern|
        unless pattern.save
          trans.rollback
          break
        end
      end
    end
  end
  
  def title
    title = ""
    patterns.each_with_index do |p, count|
      title << '/' unless count == 0
      title << p.time.to_s
    end
    title << " polyrhythm"
    title
  end
  
  def resolve
    point = 1
    until self.patterns.all?{|pattern| point % pattern.time == 0} do
      point += 1
    end
    point
  end
end

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