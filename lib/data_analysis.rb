
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
    end
  end

  def rank_by_overall_score(condition, file)
    sorted_array = @sorted.sort { |a, b| a[1][6] <=> b[1][6] }
    print sorted_array
    if condition == "top"
      sorted_array = sorted_array[0..14]
    elsif condition == "bottom"
      sorted_array = sorted_array[-15..-1]
    else
      raise "Invalid condition"
    end
    output(file, sorted_array)
  end

  private

  def output(file, array)
    CSV.open(file, "wb") do |csv|
      csv << ["Airport", "Average Cloud Ceiling", "Average Visibility", "Average Wind Speed", "Cloud Ceiling Rank", "Visibility Rank", "Wind Speed Rank", "Overall Score"]
      array.each do |record|
        csv << record.flatten
      end
    end
  end

  def add_cloud_rank
    @sorted = @data.sort_by {|airport, record| record[0]}.reverse!