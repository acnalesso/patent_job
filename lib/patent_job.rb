require 'patent_download'
require 'patent_parser'

class PatentJob
  include PatentDownload
  include PatentParser
  attr_accessor :rows, :temp


def run
  temp = download_file
  rows = parse(temp)
  update_patents(rows)
end



def update_patents
  Patent.connection.transaction {
    Patent.delete_all
      rows.each { |r| Patent.create!(r.to_hash) }
  }
end

end

class Patent

class << self
  def find(param)
    ['Test here']
  end

  def method_missing(name, param)
    if name =~ /_by_/
      find(param)
    else
      'error'
    end
  end

end

end


