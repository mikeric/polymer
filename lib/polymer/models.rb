class Polyrhythm
  include DataMapper::Resource
  
  property :id, Serial
  has n, :patterns
  
  def pattern_attributes=(pattern_attributes)
    pattern_attributes.each do |attributes|
      patterns.build(attributes)
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
  property :polyrhythm_id,  Integer, :key => true
  property :time,           Integer
  property :pattern,        String
  
  belongs_to :polyrhythm
end