module Support
  module FileHandlers
    def expect_identical_file_streams(f1,f2)
      f1.rewind
      f2.rewind
      expect(f1.read).to eq(f2.read)
    end
  end
end
