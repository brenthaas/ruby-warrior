require 'spec_helper'

describe RubyWarrior::Abilities::Walk do
  before(:each) do
    @space = double(:empty? => true, :unit => nil)
    @position = double(:relative_space => @space, :move => nil)
    @walk = RubyWarrior::Abilities::Walk.new(double(:position => @position, :say => nil))
  end

  it "should move position forward when calling perform" do
    @position.expects(:move).with(1, 0)
    @walk.perform
  end

  it "should move position right if that is direction" do
    @position.expects(:move).with(0, 1)
    @walk.perform(:right)
  end

  it "should keep position if something is in the way" do
    @position.stubs(:move).raises("shouldn't be called")
    @space.stubs(:empty?).returns(false)
    expect { @walk.perform(:right) }.not_to raise_error
  end
end
