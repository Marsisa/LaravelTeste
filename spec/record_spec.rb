
require 'spec_helper'

describe Record do

  string = '2015-03-25 21:15:00	KCXP 252115Z AUTO 08005KT 10SM BKN030 17/M01 A3033 RMK AO2'
  let(:record) { described_class.new(string) }

  it 'should convert the string to an object' do
    expect(record.objectify).to be_an_instance_of(Record)
  end

  it 'should add a 2 digit number to property "visibility"' do
    record.objectify
    expect(record.visibility).to be(10)
  end

  it 'should add a 2 digit number to property "wind_speed"' do
    record.objectify
    expect(record.wind_speed).to be(05)