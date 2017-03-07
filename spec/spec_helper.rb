# encoding: utf-8
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
SimpleCov.start { add_filter 'spec/' }

require 'rspec'
require 'watir'
require 'selenium-webdriver'
require 'feature'
require 'page-object'

def mock_watir_browser
  watir_browser = double('watir')
  allow(watir_browser).to receive(:is_a?).with(anything).and_return(false)
  allow(watir_browser).to receive(:is_a?).with(Watir::Browser).and_return(true)
  allow(watir_browser).to receive(:exists?).and_return(true)
  allow(watir_browser).to receive(:to_subtype).and_return(watir_browser)
  watir_browser
end