require 'spec_helper'

Feature::Util.configure do |flags|
  flags[:test_flag_on]  = false
  flags[:test_flag_off] = true
end

class ExamplePage
  include Feature
  include PageObject

  div :test_flag, id: "test_id"
  feature_flag :test_flag_on, :test_flag, id: "test_id"
end

class ExamplePage2
  include Feature
  include PageObject

  div :test_flag, id: "test_id2"
  feature_flag :test_flag_off, :test_flag, id: "test_id2"
end

describe Feature do
  let(:watir_browser) { mock_watir_browser }
  let(:watir_page_object) { ExamplePage.new(watir_browser) }
  let(:watir_page_object_2) { ExamplePage2.new(watir_browser) }

  context "setting values on the Feature module" do
    it "should default to the page-object since the feature flag is disabled" do
      expect(watir_browser).to receive(:div).with(:id => 'test_id').and_return(watir_browser)
      element = watir_page_object.div_element(:id => 'test_id')
      expect(element).to be_an_instance_of(PageObject::Elements::Div)
    end

    it "should find a div element" do
      expect(watir_browser).to receive(:div).with(:id => 'test_id').and_return(watir_browser)
      element = watir_page_object.test_flag_element
      expect(element).to be_an_instance_of(PageObject::Elements::Div)
    end

    it "should not find the new feature element" do
      expect(watir_browser).to receive(:div).with(:id => 'test_id').and_return(watir_browser)
      element = watir_page_object.test_flag_element
      expect(element).not_to be_an_instance_of(Watir::HTMLElement)
    end
  end

  it "should find a div element on ExamplePage2" do
    expect(watir_browser).to receive(:element).with(:id => 'test_id2').and_return(Watir::HTMLElement)
    element = watir_page_object_2.test_flag_element
    expect(element).to eq(Watir::HTMLElement)
    expect(element).not_to be_an_instance_of(PageObject::Elements::Div)
  end
end