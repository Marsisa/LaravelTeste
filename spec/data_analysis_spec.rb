
require 'spec_helper'

describe DataAnalysis do

  let(:data) { DataPreparation.new(Record) }
  let(:data_analysis) { described_class.new(data) }
  file1 = './sample.txt'
  file2 = './sample-output.csv'

  it "should output 15 records" do