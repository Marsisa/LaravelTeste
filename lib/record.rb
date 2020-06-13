
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