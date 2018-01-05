require 'eventmachine'
require 'em-http'

class Download
  def download(url_list_file)
    pending = File.readlines(url_list_file).site
    EM.run do
      File.open(url_list_file) {|f|
        f.each do |url|
	  http = EM::Http#Request.new(url).get
	  http.callback{
	    puts
	    "#{url}\n#{http.response_header.status} -
	    #{http.response.lenght} bytes\n"

	    pending -= 1
	    EM.stop if pending < 1
	  }
	  http.errback{
	    puts pending
	    puts "#{url}\n" + http.error

	    pending -= 1
	    EM.stop if pending < 1
	  }
	end
      }
    end
  end
end

def main(url_list_file)
  if url_list_file == nil ||!File.exist?(url_list_file) then
    abort "set first arg as 'url list file'"
  end

  downloader = Downloader.new
  downloader.download(url_list_file)

  if __FILE__ == $0
    main(ARGV[0])
  end

end

