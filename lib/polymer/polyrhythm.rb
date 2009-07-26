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
  
  def measures
    bars = patterns.map{|p| p.body.split(//)}
    bars = bars.map{|b| b[0] = "<span class=\"mark\">#{b[0]}</span>"; b}
    bars = bars.map{|b| b * (resolve / (b.length / 2))}
    bars = bars.map{|b| b.enum_for(:each_slice, 90 - (90 % (patterns[0].time * 2))).to_a}

    bars.each do |bar|
      bar.each do |b|
        nums = (1..b.length).select{|a| a % (patterns[0].time * 2) == 0}
        nums.slice! -1
        nums.unshift 0
        nums.each_with_index do |num, count|
          b.insert(num + count, '|')
        end
      end
    end

    bars.transpose
  end
end