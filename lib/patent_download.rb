require 'net/ftp'
require 'tempfile'

module PatentDownload

def download_file
  temp = Tempfile.new('patents')
  tempname = temp.path
  temp.close

  Net::FTP.open('localhost', 'foo', 'foopw') do |ftp|
    ftp.getbinaryfile('/tmp/data.csv', tempname)
  end
  tempname
end

end
