
require './lib/data_preparation.rb'
require './lib/record.rb'
require './lib/data_analysis.rb'



data = DataPreparation.new(Record)
output = data.execute("./sample.txt")
analysis = DataAnalysis.new(data)
analysis.add_ranks