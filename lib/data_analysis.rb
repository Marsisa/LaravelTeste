
require 'csv'

class DataAnalysis

  def initialize(data)
    @data = data.output
    @sorted = []
  end

  def add_ranks
    add_cloud_rank
    add_visibility_rank
    add_wind_speed_rank
    add_overall_score
  end

  def rank(condition, attribute, file)
    @sorted = @sorted.sort do |a, b|
      case attribute
      when "cloud_ceiling"
        a[1][3] <=> b[1][3]
      when "visibility"
        a[1][4] <=> b[1][4]
      when "wind_speed"