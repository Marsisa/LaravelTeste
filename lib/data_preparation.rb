
require './lib/record.rb'

class DataPreparation

  def initialize(record_klass)
    @record = record_klass
    @output = {}
  end

  def output
    @output
  end

  def execute(file)
    File.readlines(file).each do |line|
      airport = select_airport_key(line)
      record = @record.new(line)
      if @output[airport]
        @output[airport] << record.objectify
      else
        @output[airport] = [record.objectify]
      end
    end
    metadata
    dropRecords
    puts "dp #{@output.length}"
    @output
  end

  def metadata
    @output.each_value do |v|
      running_cloud_ceiling = 0
      running_visibility = 0
      running_wind_speed = 0
      v.each do |record|
        if record.cloud_ceiling
          running_cloud_ceiling += record.cloud_ceiling
        end
        if record.visibility
          running_visibility += record.visibility
        end
        if record.wind_speed
          running_wind_speed += record.wind_speed
        end
      end
      average_cloud_ceiling = running_cloud_ceiling / v.length
      average_visibility = running_visibility / v.length
      average_wind_speed = running_wind_speed / v.length
      metadata = [average_cloud_ceiling, average_visibility, average_wind_speed]
      v.unshift(metadata)
    end
    @output
  end

  def dropRecords
    @output.each_pair do |airport, records|
      @output[airport] = records[0]
    end
  end


  def select_airport_key(string)
    index = string =~ (/(?<!\w)(K+\w{3})(?!\w)/)
    airport = string[index..index+3]
    airport