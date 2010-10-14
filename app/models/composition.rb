class Composition
  include MongoMapper::Document
  
  many :patterns
  
  validates_associated :patterns
  
  def title
    "#{patterns.map{|p| p.time_signature}.uniq.join(', ')} polyrhythm"
  end
  
  def resolve
    patterns.map{|p| p.body.length}.inject {|a, b| a.lcm(b)}
  end
  
  def measures
    bars = patterns.map{|p| p.body.split(//)}
    bars = bars.map{|b| b[0] = "<span>#{b[0]}</span>"; b}
    bars = bars.map{|b| b * (resolve / (b.length))}
    bars = bars.map{|b| b.enum_for(:each_slice, patterns[0].body.length).map{|a| a.unshift("|").join}}
    bars.map{|b| b.enum_for(:each_slice, 90 / (patterns[0].body.length + 1)).to_a}.transpose.map{|b| b.map{|a| a.join}}
  end
end
