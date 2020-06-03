
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
        a[1][5] <=> b[1][5]
      else
        raise "Invalid attribute"
      end
    end
    if condition == "top"
      sorted_array = @sorted[0..14]
    elsif condition == "bottom"
      sorted_array = @sorted[-15..-1]
    else
      raise "Invalid condition"
    end
    output(file, sorted_array)
  end

  def add_overall_score
    @sorted.each do |scores|
      rank = scores[1][3] + scores[1][4] + scores[1][5]
      scores[1] << rank