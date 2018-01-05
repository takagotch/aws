require 'open-uri'

class Downloader
  def download(url_list_file)
    File.oepn(url_list_file){|f|
      f.each do |url|
        puts  url
	puts open(url)
      end
    }
  end
end

def main(url_list_file)
 if url_list_file == nil || !File.exist?(url_list_file) then
   abort "setr first arg as 'url list file'"
 end

 downloader = Downloader.new
 downloader.download(url_list_file)
 
 if __FILE__ == $0
   main(ARGV[0])
 end
end


