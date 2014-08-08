require_relative 'spec_helper'
require_relative '../src/simulator'
describe 'Simulator' do
  let(:simulator) {Simulator.new(5,5)}
  
  context "invalid commands" do
    it "cannot place outside the grid" do
      expect(simulator.command(Directive.new("PLACE 8,9,E"))).to eq(false)
    end
    it "cannot move before placement" do
      expect(simulator.command(Directive.new("MOVE"))).to eq(false)
    end
    it "cannot move outside the grid" do
      simulator.command(Directive.new("PLACE 0,0,S"))
      expect(simulator.command(Directive.new("MOVE"))).to eq(false)
    end  
    it "rejects invalid commands" do
      expect{simulator.command(Directive.new("TURN"))}.to raise_error
    end
  end
  
  context "valid commands" do
    it "accepts valid place command" do
      expect(simulator.command(Directive.new("PLACE 2,2,E"))).to eq(true)
    end
    it "accepts valid move command" do
      simulator.command(Directive.new("PLACE 2,2,E"))
      expect(simulator.command(Directive.new("MOVE"))).to eq(true)
    end    
    it "accepts valid left command" do
      simulator.command(Directive.new("PLACE 2,2,E"))
      expect(simulator.command(Directive.new("LEFT"))).to eq(true)      
    end
    it "accepts valid right command" do
      simulator.command(Directive.new("PLACE 2,2,E"))
      expect(simulator.command(Directive.new("RIGHT"))).to eq(true)
    end
    it "accepts the report command" do
      simulator.command(Directive.new("PLACE 2,2,E"))
      expect{simulator.command(Directive.new("REPORT"))}.to output("Robot is at position, (2, 2) and is facing E\n").to_stdout
    end
  end
  
end
