require_relative 'spec_helper'
require_relative '../src/grid'
require_relative '../src/position'

describe "Grid" do
  context "invalid grid" do
     it "does not accept values lesser than one" do
       expect{Grid.new(-5, -5)}.to raise_error ArgumentError
     end     
  end
  
  context "valid grid" do
    it "accepts positive values" do
      expect(Grid.new(5,5)).to_not eq(nil)
    end
    let(:grid) {Grid.new(5,5)}
    context "valid points" do
      it "returns the true for origin" do
        expect(grid.valid_position?(Position.new(0,0))).to be true   
      end
      it "re†urns true for the corner diagonally opposite to the origin" do
        expect(grid.valid_position?(Position.new(4,4))).to be true
      end
      it "re†urns true for the corner above the origin" do
        expect(grid.valid_position?(Position.new(0,4))).to be true
      end
      it "re†urns true for the corner to the right of the origin" do
        expect(grid.valid_position?(Position.new(4,0))).to be true
      end
      it "returns true for the point part of the grid" do
        expect(grid.valid_position?(Position.new(2,2))).to be true
      end
    end
    
    context "invalid points" do
      it "returns false for negative values" do
        expect(grid.valid_position?(Position.new(-1,-1))).to be false   
      end
      it "re†urns false for points outside the grid" do
        expect(grid.valid_position?(Position.new(0,5))).to be false
      end
    end
  end
end
