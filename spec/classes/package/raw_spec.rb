require "spec_helper"

describe "Officedoc::Package::Raw" do
  def new_raw_for_file(name)
    Officedoc::Package::Raw.new( file_stream(name) )
  end
  
  let(:raw_docx_sample_filename) { "samples/sample1.docx" }
  let(:raw_docx_sample) { new_raw_for_file raw_docx_sample_filename }

  it "should correctly count the number of files in package" do
    expect(raw_docx_sample.file_names.count).to eq(count_files_in_zip raw_docx_sample_filename)
  end
  it "should correctly list the files in package" do
    expect(raw_docx_sample.file_names).to match_array(list_files_in_zip raw_docx_sample_filename)
  end
  
  it "should list the parts" do
    expect(raw_docx_sample.parts.count).to be > 0

    expect(raw_docx_sample.parts.map(&:name)).to include "/word/document.xml"
    expect(raw_docx_sample.parts.map(&:name)).to include "/docProps/core.xml"
    
    expect(raw_docx_sample.parts.map(&:type)).to include "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"
    expect(raw_docx_sample.parts.map(&:type)).to include "application/vnd.openxmlformats-package.core-properties+xml"
  end
  it "should find the part by full type" do
    parts = raw_docx_sample.parts.of_type "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"
    expect(parts.size).to eq 1
    expect(parts[0].name).to eq "/word/document.xml"
  end
  it "should find the part by partial type" do
    parts = raw_docx_sample.parts.of_type "wordprocessingml.document.main", partial: true
    expect(parts.size).to eq 1
    expect(parts[0].name).to eq "/word/document.xml"
  end
  it "should detect the document type" do
    expect(raw_docx_sample.document_type).to eq "wordprocessingml"
  end
end