
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