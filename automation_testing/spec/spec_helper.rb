require 'rspec'
require 'uri'
require 'logger'

RSpec.configure do |config|
	config.before :all do
		@logger = Logger.new "| tee log/test.log"
		@logger.datetime_format = '%y-%m-#d %H:%M:%S'
		@logger.formatter = proc do |severity, datetime, _, msg|
			format = "\n[#{severity} - #{datetime}] - #{msg}"
		end
		BASE_URL = "http://0.0.0.0:3000"
		ENV['DRIVER'] = 'LOCAL'
		BROWSER ||= :firefox
    # Service to test through cloud systems with all the operating sytems, browsers, and versions
		BROWSERSTACK_URL ||= "http://#{ENV['BS_USERNAME']}:#{ENV['BS_AUTHKEY']}@hub.browserstack.com/wd/hub"

		case ENV['DRIVER']

		when 'BROWSERSTACK'
			@logger.info 'Creating Browserstack driver'
			caps = Selenium::WebDriver::Remote::Capabilities.new
			caps['os'] = 'Windows'
			caps['os_version'] = '8'
			caps['browser'] = 'firefox'
			caps['browser_version'] = '31'

			caps['browserstack.selenium_version'] = '2.43.1'

			@driver = Selenium::WebDriver.for(:remote, :url => BROWSERSTACK_URL, :desired_capabilities => caps)

		when 'LOCAL'
			@logger.info 'Creating Local driver'

			@driver = Selenium::WebDriver.for BROWSER
		else
			@driver = Selenium::WebDriver.for BROWSER
		end

		@logger.info 'Navigating to Deerfield'
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	end

	config.after :all do
		@logger.info 'Quitting driver'
		@driver.quit unless @driver.nil?
	end
end
