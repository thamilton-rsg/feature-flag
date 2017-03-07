#
# util.rb
#
module Feature
  #
  # This is the main class in which we configure which feature flags to enable/disable.
  #
  class Util

    @flags = {}

    class << self
      attr_accessor :flags

      #
      # This method enables/disables all feature flags that will be used.
      #
      def configure
        yield flags if block_given?
      end

    end # => end self
  end # => end Util
end # => end Feature