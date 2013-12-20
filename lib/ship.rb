class Ship
  @@exception_reporting_enabled = false
  @@api_url = ""
  @@license = ""
  class_attribute :license
  class_attribute :api_url
  class_attribute :exception_reporting_enabled
  def self.config(exception_reporting_enabled, api_url, license)
    self.license = license
    self.api_url = api_url
    self.exception_reporting_enabled = exception_reporting_enabled
  end

  def self.handle_exception(e,env)
    if self.exception_reporting_enabled
      params = {:message => e.message, :trace => e.backtrace.to_s, :error_type => e.class.to_s}
      url = "#{self.api_url}/#{self.license}/"
      RestClient.post "#{self.api_url}/#{self.license}/skirmish/new",
                      params
    end
  end







end