require 'net/http'
require 'rexml/document'
require 'digest/sha1'

class SalaryGetter


# Calling the Salary.com API
# mm6




def self.getData(jobCode, zip)

  # Compute UTC Time
  t = Time.now.utc
  mon = t.month
  dd = t.day
  yyyy = t.year
  hh = t.hour
  if hh >= 12 then suffix = "PM"
  else suffix = "AM"
  end
  hh = hh % 12   # reduce modulo 12

  min = t.min
  sec = t.sec

  # Build a time stamp that will be part of a URL
  utctimestamp = mon.to_s+'%2F'+dd.to_s+'%2F'+yyyy.to_s+'+'+hh.to_s+'%3A'+min.to_s+'%3A'+sec.to_s+'+'+suffix


  # Build a hashable timestamp (This is how the server will compute the hash.)
  utctimehashstamp = mon.to_s+'/'+dd.to_s+'/'+yyyy.to_s+' '+hh.to_s+':'+min.to_s+':'+sec.to_s+' '+ suffix


  # Use security key provided
  securityKey = 'SalaryHR'

  # Use an example job code


  # DG: allowing inputs
  #jobCode = 'CM02000003'    #Job Code of senior technical writer

  # use a Pittsburgh zip code
  #zip = '15216'     #complete with 5 digit postal code

  # Use provided partner code
  partnerCode = 'EQUIPAY4094055567106'   #API-Key or partner code from Salary.com

  # create string to be hashed
  stringToBeHashed = securityKey+'-'+partnerCode+'-'+utctimehashstamp
  stringToBeHashed.strip!

  #convert to UTF-8

#  stringToBeHashed.force_encoding("UTF-8")
  #stringToBeHashed = stringToBeHashed.encode("UTF-8")

  #compute hash using SHA1
  hashCode = Digest::SHA1.new << stringToBeHashed

  # Build URL
  mainURL = 'http://api.salary.com/salarywizard/layoutscripts/Compdata.asp?'
  jobCodeURL = 'jobcode='+jobCode
  zipCodeURL = '&zip=' + zip
  partnerCodeURL = '&partnercode=' + partnerCode
  utctimestampURL = '&utctime=' + utctimestamp
  hashKeyURL = '&hashkey=' + hashCode.to_s
  url = mainURL+jobCodeURL+ zipCodeURL+ partnerCodeURL+ utctimestampURL+hashKeyURL
  

  # get the XML data as a string
  xml_data = Net::HTTP.get_response(URI.parse(url)).body

  doc = REXML::Document.new xml_data

  salary = doc.elements["SWZ"].elements["BenefitBaseSalary50th_M"].cdatas()[0].value
  salary.gsub("$", "").gsub(",","").to_f

end
end

sal = SalaryGetter.getData('LE11000082', '15222')
puts sal
