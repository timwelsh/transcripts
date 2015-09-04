require 'selenium-webdriver'
require 'spec_helper.rb'

describe "SignIn" do
  it "test_sign_in" do
    @driver.get(BASE_URL + "/")
    @driver.find_element(:link, "Login").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "prashant.vardhan@inveera.com"
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "12345678"
    @driver.find_element(:name, "commit").click
    @wait.until { @driver.find_element(:css, "span.glyphicon-off") }
    @logger.info 'Logging out'
    @driver.find_element(:link, "Logout").click
    expect(@driver.current_url).to eq BASE_URL + "/"
    @logger.info 'Login working fine'
  end
end
