require "rubygems"
require "httparty"

class Messente  
  
  include HTTParty
  
  base_uri "https://api2.messente.com/"
  
  def initialize(options)
    @defaults = options
  end

  def send(options)
    query = @defaults.merge(options)
    
    response = self.class.get("/send_sms/", :query => query)
    items    = response.split(" ")  
    return false if ("ERROR" == items[0] or "FAILED" == item[0])
     
    {:sms_unique_id => items[1]}
  end
  
  def balance
    response = self.class.get("/get_balance/", :query => @defaults)
    items    = response.split(" ")
    return false if ("ERROR" == items[0] or "FAILED" == item[0])

    items[1].to_f
  end
  
  def report(options) 
	query = @defaults.merge(options)
    response = self.class.get("/get_dlr_response/", :query => query)
    pp items    = response.split(" ")
    return false if ("ERROR" == items[0] or "FAILED" == item[0])
    
    items[1] 
  end 
  
end