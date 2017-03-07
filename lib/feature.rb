#
# feature.rb
#
require "feature/version"

module Feature

  require "feature/util"
  require "feature/flag"

  # @private
  def self.included(cls)
    cls.extend Feature::Flag
  end

end # => end Feature
