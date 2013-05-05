require 'csv'
module PatentParser

def parse(temp)
  CSV.read(temp, headers: true)
end

end
