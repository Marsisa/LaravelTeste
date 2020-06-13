
class Record

  attr_reader :visibility, :wind_speed, :cloud_ceiling

  def initialize(string)
    @string = string