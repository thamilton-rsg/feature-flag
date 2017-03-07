require 'spec_helper'

describe Feature::Util do
  context "with single feature flag enabled" do
    before(:all) do
      Feature::Util.configure do |flag|
        flag[:test_1] = true
      end
    end

    it "has a single correct true value" do
      expect(Feature::Util.flags[:test_1]).to be(true)
    end
  end

  context "with multiple feature flags enabled" do
    before(:all) do
      Feature::Util.configure do |flag|
        flag[:test_1] = true
        flag[:test_2] = true
      end
    end

    it "has multiple correct true values" do
      expect(Feature::Util.flags[:test_1]).to be(true)
      expect(Feature::Util.flags[:test_2]).to be(true)
    end
  end

  context "with single feature flag disabled" do
    before(:all) do
      Feature::Util.configure do |flag|
        flag[:test_1] = false
      end
    end

    it "has a single correct false value" do
      expect(Feature::Util.flags[:test_1]).to be(false)
    end
  end

  context "with multiple feature flags disabled" do
    before(:all) do
      Feature::Util.configure do |flag|
        flag[:test_1] = false
        flag[:test_2] = false
      end
    end

    it "has multiple correct false values" do
      expect(Feature::Util.flags[:test_1]).to be(false)
      expect(Feature::Util.flags[:test_2]).to be(false)
    end
  end

  context "with a combination of feature flags enabled/disabled" do
    before(:all) do
      Feature::Util.configure do |flag|
        flag[:test_1] = true
        flag[:test_2] = false
      end
    end

    it "has contains both true and false values" do
      expect(Feature::Util.flags[:test_1]).to be(true)
      expect(Feature::Util.flags[:test_2]).to be(false)
      expect(Feature::Util.flags[:test_1]).not_to be(false)
      expect(Feature::Util.flags[:test_2]).not_to be(true)
    end
  end
end