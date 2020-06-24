
require 'spec_helper'

describe Record do

  string = '2015-03-25 21:15:00	KCXP 252115Z AUTO 08005KT 10SM BKN030 17/M01 A3033 RMK AO2'
  let(:record) { described_class.new(string) }
