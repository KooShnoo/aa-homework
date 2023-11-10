require 'rspec'
require 'dessert'

# Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.

describe Dessert do
  let(:chef) { double('chef', :titleize => 'Chef Gustau') }
  let(:cake) { Dessert.new('Cake', 10, chef) }

  describe '#initialize' do
    it 'sets a type' do
      expect(cake.type).to eq 'Cake'
    end

    it 'sets a quantity' do
      expect(cake.quantity).to eq 10
    end

    it 'starts ingredients as an empty array' do
      expect(cake.ingredients).to be_empty
    end

    it 'raises an argument error when given a non-integer quantity' do
      expect { Dessert.new('Muffin', 'a lot', chef) }.to raise_error(ArgumentError)
    end
  end

  describe '#add_ingredient' do
    it 'adds an ingredient to the ingredients array' do
      cake.add_ingredient('flour')
      expect(cake.ingredients).to include('flour')
    end
  end

  describe '#mix!' do
    it 'shuffles the ingredient array' do
      ingredients = %w[flour eggs sugar water love]
      ingredients.each { |ingredient| cake.add_ingredient(ingredient) }
      cake.mix!
      expect(cake.ingredients).to_not eq ingredients
    end
  end

  describe '#eat' do
    it 'subtracts an amount from the quantity' do
      cake.eat(1)
      expect(cake.quantity).to eq 9
    end

    it 'raises an error if the amount is greater than the quantity' do
      expect { cake.eat(100) }.to raise_error(RuntimeError)
    end
  end

  describe '#serve' do
    it "contains the titleized version of the chef's name" do
      expect(cake.serve).to eq 'Chef Gustau has made 10 Cakes!'
    end
  end

  describe '#make_more' do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      cake.make_more
    end
  end
end
