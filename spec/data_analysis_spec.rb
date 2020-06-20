
require 'spec_helper'

describe DataAnalysis do

  let(:data) { DataPreparation.new(Record) }
  let(:data_analysis) { described_class.new(data) }
  file1 = './sample.txt'
  file2 = './sample-output.csv'

  it "should output 15 records" do
    data.execute(file1)
    expect(data_analysis.rank("top", "cloud_ceiling", file2).length).to eq(15)
  end

  it "should output 15 records" do
    data.execute(file1)
    expect(data_analysis.rank("bottom", "visibility", file2).length).to eq(15)
  end
