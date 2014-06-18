require_relative 'spec_helper'
require_relative '../src/simulator'
describe 'Simulator' do
  let(:simulator) {Simulator.new(5,5)}
  
  context "invalid commands" do
    it "cannot place outside the grid" do
      expect(simulator.command("PLACE 8,9,E")).to eq(false)
    end
    it "cannot move before placement" do
      expect(simulator.command("MOVE")).to eq(false)
    end
    it "cannot move outside the grid" do
      simulator.command("PLACE 0,0,S")
      expect(simulator.command("MOVE")).to eq(false)
    end  
    it "rejects invalid commands" do
      expect(simulator.command("TURN")).to eq(false)
    end
  end
  context "valid commands" do
    it "accepts valid place command" do
      expect(simulator.command("PLACE 2,2,E")).to eq(true)
    end
    it "accepts valid move command" do
      expect(simulator.command("PLACE 2,2,E")).to eq(true)
      expect(simulator.command("MOVE")).to eq(true)
    end    
    it "accepts valid left and right commands" do
      expect(simulator.command("PLACE 2,2,E")).to eq(true)
      expect(simulator.command("LEFT")).to eq(true)
      expect(simulator.command("RIGHT")).to eq(true)
    end
    
  end
end
