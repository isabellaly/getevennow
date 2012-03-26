require 'net/http'
require 'rexml/document'
require 'digest/sha1'

class PagesController < ApplicationController
	include ChartsHelper
  def home
    # @title = "home"
  end
  
  def showmemoney

	  if not params[:jobcode].nil?
	  	
	  	salarycomjob = SalaryComJob.where(:code => params[:jobcode]).limit(1)

	  	if salarycomjob.count > 0

	  		blsjob = Blsjob.where(:bls_job_code => salarycomjob.first.bls_job_code).limit(1)

		  	bls_nf   = blsjob.first.workers_women     # number of females
        bls_nm = blsjob.first.workers_men     # number of male workers
        bls_wf  = blsjob.first.earnings_women   # wage of women (median salary)
        bls_wm = blsjob.first.earnings_men # wage of men (median salary)

        # compute percent female
        pf = bls_nf.to_f / (bls_nm+bls_nf).to_f

        # compute the gap
        g = bls_wf.to_f / bls_wm.to_f

        paychktype = params[:paychk_radio].to_f
        # From Salary.com we have the median weekly wage
        sc_w = getsalarywebservicedata(salarycomjob.first.code, params[:zip][:code])/52.177

        # we want to estimate the wage for females and wage for male

        wm = (sc_w.to_f / (pf * g + 1.0 - pf).to_f)
        wf   = (g.to_f * wm.to_f)

        wm = (wm * paychktype).round(2)
        wf = (wf * paychktype).round(2)

        years = [0,5,10,15,20,25,30]
        inflation = 0.03


        @highchartdata = {:Men => wm, :Women => wf }
        @wagegaptrend = {:Men => years.map {|y| (wm*(1 + inflation)**y).round(2)}, :Women => years.map {|y| ( wf*(1 + inflation)**y).round(2)} }
	  	end
	  	

	  end
  	
  end

  private

  def getsalarywebservicedata(jobcode, zip)
  	#UTC time
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
    zip = '15222'
    # Build a time stamp that will be part of a URL
    utctimestamp = mon.to_s+'%2F'+dd.to_s+'%2F'+yyyy.to_s+'+'+hh.to_s+'%3A'+min.to_s+'%3A'+sec.to_s+'+'+suffix


    # Build a hashable timestamp (This is how the server will compute the hash.)
    utctimehashstamp = mon.to_s+'/'+dd.to_s+'/'+yyyy.to_s+' '+hh.to_s+':'+min.to_s+':'+sec.to_s+' '+ suffix


    # Use security key provided
    securityKey = 'SalaryHR'

    # Use provided partner code
    partnerCode = 'EQUIPAY4094055567106'   #API-Key or partner code from Salary.com

    # create string to be hashed
    stringToBeHashed = securityKey+'-'+partnerCode+'-'+utctimehashstamp
    stringToBeHashed.strip!


    #compute hash using SHA1
    hashCode = Digest::SHA1.new << stringToBeHashed

    # Build URL
    mainURL = 'http://api.salary.com/salarywizard/layoutscripts/Compdata.asp?'
    jobCodeURL = 'jobcode='+jobcode
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
