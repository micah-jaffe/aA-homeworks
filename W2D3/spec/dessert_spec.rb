require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "Ratatouille") }
  subject(:dessert) { Dessert.new("Cake", 3, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("Cake", 4.5, "dummy") }.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("chocolate")
      expect(dessert.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("chocolate")
      dessert.add_ingredient("flour")
      dessert.add_ingredient("eggs")
      expect(dessert.mix!).to match_array(["chocolate", "flour", "eggs"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(9) }.to raise_error(RuntimeError, "not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Ratatouille the Great Baker")

      expect(dessert.serve).to include("Ratatouille the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      dessert.make_more
    end
  end
end
