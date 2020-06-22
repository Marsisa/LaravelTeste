
require 'spec_helper'
require 'record'

describe DataPreparation do

  let(:data_preparation) { described_class.new(Record) }
  file = './sample.txt'

  it "should initialize with an empty hash" do
    expect(data_preparation.output).to eq({})
  end

  it "should open a file and read a line" do
    expect(data_preparation.execute(file).length).to eq(20)
  end