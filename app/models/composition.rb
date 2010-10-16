class Composition
  include MongoMapper::Document
  
  many :patterns
  timestamps!
  
  validates_associated :patterns
  
  after_save {self.destroy_stale}
  
  def self.destroy_stale
    all(:created_at.lt => 1.day.ago).each(&:destroy)
  end
  
  def base
    patterns.first
  end
  
  def time_signatures
    patterns.map{|p| p.time_signature}.uniq
  end
  
  def resolve_point
    patterns.map{|p| p.body.length}.inject {|a, b| a.lcm(b)}
  end
  
  def bars(pattern=base)
    resolve_point / pattern.body.length
  end
end
