require 'rails_helper'

describe ApplicationController do

  describe "#append_uuid" do
    it "adds a 8 character uuid to the end of the filename" do
      filename = 'test.txt'
      expect(subject.append_uuid(filename).length).to eq(17)
    end
  end

  describe "#check_unique_identifiers" do
    it 'returns true when all unique identifiers in the file are unique' do
      expect(subject.check_unique_identifiers('/home/bertzz/Projects/Ubiquity_TT/test_good.csv')).to be_truthy
    end

    it 'returns false if all unique identifiers in the file are not unique' do
      expect(subject.check_unique_identifiers('/home/bertzz/Projects/Ubiquity_TT/test_bad.csv')).to be_falsy
    end
  end

end
