
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