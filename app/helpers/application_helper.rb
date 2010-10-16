Polymer.helpers do
  def render_composition(comp, measures=1)
    comp.patterns.map do |pattern|
      tagged = pattern.body.split(//)
      tagged[0] = "<span>#{tagged[0]}</span>"
      measure = tagged * comp.bars(pattern) * measures
      measure.enum_for(:each_slice, comp.base.body.length).map{|bar| bar.unshift("|").join}
    end.transpose.in_groups_of(90 / comp.base.body.length, false).map(&:transpose)
  end
end