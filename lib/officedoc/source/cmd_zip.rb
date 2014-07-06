module Officedoc
  module Source
    class CmdZip
      def initialize(filename)
        @filename = filename
      end
      def entries
        @entries ||= String(`zipinfo -1 "#{@filename}"`).split
      end
      def entry(name)
        # unzip treats [ ] specially, so requires escaping for '[' and ']' in filenames like '[Content_Types].xml'
        unzip_fn = name
          .gsub('[', '\\\\\[')
          .gsub(']', '\\\\\]')
        command = "unzip -p \"#{@filename}\" \"#{unzip_fn}\""
        contents =`#{command}`
        # Can do a StringIO on top of that
        # StringIO.new( contents, "rb" )
        # Alternatives: pipes to shell commands
        # 1)
        # IO.popen(command)
        # 2) 
        # require "open3"
        # stdin, stdout, stderr = Open3.popen3(command)
        # stdout
      end
    end
  end
end