require 'spec_helper'

class Player
  def turn(warrior)
  end
end

describe RubyWarrior::Units::Warrior do
  describe 'name'
  context 'when the warrior name is set to an empty value' do
    before { subject.name = '' }

    it 'defaults to "warrior"' do
      expect(subject.name).to eq 'Warrior'
    end
  end

  context 'when the name is set to a value' do
    let(:name) { 'Joe' }

    before { subject.name = name }

    it 'uses the defined name' do
      expect(subject.name).to eq name
    end
  end

  it 'defaults to 20 max health' do
    expect(subject.max_health).to eq 20
  end

  it 'defaults to 0 points' do
    expect(subject.score).to be_zero
  end

  context 'when earning points' do
    let(:points) { 5 }

    it 'ganes the earned points' do
      expect { subject.earn_points(points) }
        .to change(subject, :score)
        .from(0)
        .to(points)
    end
  end

  describe '#play_turn' do
    let(:player) { double(Player, play_turn: true) }
    let(:turn) { 'turn' }

    before { allow(Player).to receive(:new).and_return player }

    it 'delegates to player' do
      subject.play_turn('turn')
      expect(player).to have_received(:play_turn).with(turn)
    end
  end

  describe '#player' do
    let!(:player) { class_spy(Player, new: double).as_stubbed_const }

    it 'memoizes player' do
      warrior = subject
      expect(Player).to receive(:new).once
      2.times { |_| warrior.player }
    end
  end
  
  it "should have an attack power of 5" do
    expect(subject.attack_power).to eq(5)
  end
  
  it "should have an shoot power of 3" do
    expect(subject.shoot_power).to eq(3)
  end
  
  it "should appear as @ on map" do
    expect(subject.character).to eq("@")
  end

  describe 'when adding a golem ability' do
    let(:ability) { :walk! }

    before { subject.add_golem_abilities ability }

    it 'has_golem?' do
      expect(subject.has_golem?).to be true
    end

    it 'adds the ability to base_golem' do
      expect(subject.base_golem.abilities).to have_key :walk!
    end
  end
end
