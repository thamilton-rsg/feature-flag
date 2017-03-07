require "feature"
require "watir"
require "page-object"

#
# Create the browser and navigate to login page.
#
browser = Watir::Browser.new :chrome
browser.goto("https://login.mailchimp.com/")

# Example 1
Feature::Util.configure do |flags|
  flags[:login_page_flag] = false
end

class Example1
  include Feature
  include PageObject

  #
  # Our initial page-object element with the feature flag enabled.
  # This means our default id here will not be used.
  #
  text_field :username, id: "example_username"

  #
  # Because our feature flag is enabled, we use this method to interact with the element.
  # All elements are returned with "{example}_element".
  #
  # :login_page_flag - this refers to our feature flag name.
  # :username - this refers to the name of the element we will call.
  #
  # Note: If there are new elements that do not exist on the page but you need to interact with them,
  #         You may create them using this same example.
  #
  feature_flag :login_page_flag, :username, id: "username"

end

page = Example1.new(browser)

begin
  page.username_element.send_keys("hello world")
rescue Exception
  # Do nothing
end

## Example 2
Feature::Util.configure do |flags|
  flags[:login_page_flag] = true
end

class Example2
  include Feature
  include PageObject

  #
  # Our initial page-object element with the feature flag enabled.
  # This means our default id here will not be used.
  #
  text_field :username, id: "example_username"

  #
  # Because our feature flag is enabled, we use this method to interact with the element.
  # All elements are returned with "{example}_element".
  #
  # :login_page_flag - this refers to our feature flag name.
  # :username - this refers to the name of the element we will call.
  #
  # Note: If there are new elements that do not exist on the page but you need to interact with them,
  #         You may create them using this same example.
  #
  feature_flag :login_page_flag, :username, id: "username"

end

page = Example2.new(browser)

page.username_element.send_keys("hello world")

sleep 5
