
class Record

  attr_reader :visibility, :wind_speed, :cloud_ceiling

  def initialize(string)
    @string = string
    @visibility
    @wind_speed
    @cloud_ceiling
  end

  def objectify
    extract_visibility
    extract_wind_speed
    extract_cloud_ceiling
    self
  end

  private

  def extract_visibility
    index = @string =~ /(?<=\s)(\w{2}+SM)(?=\s)/
    if index
      @visibility = @string[index..index+1].to_i
    else
      index = @string =~ /(?<=\s)(\w+SM)(?=\s)/
      if index
        @visibility = @string[index].to_i
      else
        @visibility = 0
      end
    end