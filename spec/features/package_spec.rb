require "spec_helper"

describe "Officedoc" do
  it "should open OOXML package by filename" do
    fn = rspec_file "samples/sample1.docx"
    od = Officedoc.open( filename: fn )
    expect(od).not_to be_nil
    expect(od.filename).to eq(fn)
    f = open(fn,"rb")
    expect_identical_file_streams f, od.raw.stream 
  end
  it "should open OOXML package from stream" do
    fn = rspec_file "samples/sample1.docx"
    f = open(fn,"rb")
    od = Officedoc.open( stream: f )
    expect(od).not_to be_nil
    expect(od.raw.stream).not_to be_nil
    expect(od.raw.stream).to eq(f)
  end
end