require 'spec_helper'

describe RubyWarrior::Abilities::DirectionOf do
  before(:each) do
    @position = double
    @distance = RubyWarrior::Abilities::DirectionOf.new(double(:position => @position, :say => nil))
  end
  
  it "should return relative direction of given space" do
    @position.stubs(:relative_direction_of).with(:space).returns(:left)
    expect(@distance.perform(:space)).to eq(:left)
  end
end
