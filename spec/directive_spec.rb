require_relative 'spec_helper'
require_relative '../src/directive'

describe "Directive" do
  let(:command_place){"PLACE 2,3,N"}
  let(:directive_place){Directive.new(command_place)}
  context "for the place command" do
    it "returns the place command" do
      expect(directive_place.command).to eq(:place)
    end
    it "converts numeric parameters to numerics" do
      expect(directive_place.arguments[0]).to eq(2)
    end
    it "converts alpha parameters to symbols" do
      expect(directive_place.arguments[2]).to eq(:N)
    end
  end
  let(:command_move){"MOVE"}
  let(:directive_move){Directive.new(command_move)}
  context "for the move command" do
    it "returns the move command" do
      expect(directive_move.command).to eq(:move)
    end
  end

  let(:command_right){"RIGHT"}
  let(:directive_right){Directive.new(command_right)}
  context "for the right command" do
    it "returns the right command" do
      expect(directive_right.command).to eq(:right)
    end
  end

  let(:command_left){"LEFT"}
  let(:directive_left){Directive.new(command_left)}
  context "for the left command" do
    it "returns the left command" do
      expect(directive_left.command).to eq(:left)
    end
  end
end
