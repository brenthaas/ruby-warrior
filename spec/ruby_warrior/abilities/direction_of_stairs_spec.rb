require 'spec_helper'

describe RubyWarrior::Abilities::DirectionOfStairs do
  before(:each) do
    @position = double
    @distance = RubyWarrior::Abilities::DirectionOfStairs.new(double(:position => @position, :say => nil))
  end
  
  it "should return relative direction of stairs" do
    @position.stubs(:relative_direction_of_stairs).returns(:left)
    expect(@distance.perform).to eq(:left)
  end
end
