#
# flag.rb
#
module Feature
  module Flag
    #
    # This method checks to see if feature flags are enabled/disabled.
    # If the flag is enabled, we use the secondary locators instead of
    # the page-objects. This returns a base [Watir::Element]
    #
    # @param [Symbol] flag_name
    # @param [Symbol] element_name
    # @param [Hash] new_mechanics
    #
    def feature_flag(flag_name, element_name, new_mechanics)
      if Feature::Util.flags[flag_name]
        define_method("#{element_name}_element") do
          @browser.element(new_mechanics)
        end
      end
    end

  end # => end Flag
end # => end Feature