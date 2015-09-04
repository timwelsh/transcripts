require 'selenium-webdriver'
require 'spec_helper.rb'


describe "SignUpSpec" do

  it "test_sign_up_spec" do
    @logger.info 'Going to Login page'
    @driver.get(BASE_URL + "/#/login")

    @logger.info 'Signing up'
    @wait.until {  @driver.find_element(:link, "Create an account") }
    @driver.find_element(:link, "Create an account").click
    @driver.find_element(:name, "company").clear
    @driver.find_element(:name, "company").send_keys "Wintac Online"
    @driver.find_element(:name, "name").clear
    @driver.find_element(:name, "name").send_keys "Marc"
    @driver.find_element(:name, "surname").clear
    @driver.find_element(:name, "surname").send_keys "Cobery"
    @driver.find_element(:name, "password").clear
    @driver.find_element(:name, "password").send_keys "12345678"
    @driver.find_element(:name, "passwordConfirmation").clear
    @driver.find_element(:name, "passwordConfirmation").send_keys "12345678"
    @driver.find_element(:name, "email").clear
    # Need to change email every time for uniquenes
    @driver.find_element(:name, "email").send_keys "t23@gmail.com"
    @driver.find_element(:name, "phone").clear
    # Need to change phone every time for uniquenes
    @driver.find_element(:name, "phone").send_keys "1234561234"
    @driver.find_element(:css, "input.btn.btn-primary").click
    @wait.until {  @driver.find_element(:link, "Create an account") }
    expect(@driver.find_element(:link, "Create an account").displayed?).to eq true
    @logger.info 'Sign up successfull'
  end

end
