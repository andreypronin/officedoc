require "spec_helper"

describe "Officedoc::Package::Raw" do
  def new_raw_for_file(name)
    Officedoc::Package::Raw.new( file_stream(name) )
  end

  it "should correctly count the number of files in package" do
    fn = "samples/sample1.docx"
    r = new_raw_for_file fn
    expect(r.files.count).to eq(count_files_in_zip fn)
  end
  it "should correctly list the files in package" do
    fn = "samples/sample1.docx"
    r = new_raw_for_file fn
    expect(r.files).to match_array(list_files_in_zip fn)
  end
end