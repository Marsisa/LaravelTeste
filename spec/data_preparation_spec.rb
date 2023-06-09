
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

  it "should take a string and enter it to hash with airport code as key" do
    string = '2015-03-25 21:15:00	KCXP 252115Z AUTO 08005KT 10SM CLR 17/M01 A3033 RMK AO2'
    expect(data_preparation.select_airport_key(string)).to be(:KCXP)
  end

end