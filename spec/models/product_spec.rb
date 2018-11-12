require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(
        name: "Anything", 
        price_cents: 400,           
        quantity: 4, 
        category: Category.new )
    }

    it 'is valid with valid attributes' do 
      expect(subject).to be_valid 
    end 

    it 'is not valid without name' do 
      subject.name = nil
      expect(subject).to_not be_valid 
    end

    it 'is not valid without name' do 
      subject.price_cents = nil
      expect(subject).to_not be_valid 
    end

    it 'is not valid without quantity' do 
      subject.quantity = nil
      expect(subject).to_not be_valid 
    end

    it 'is not valid without category' do 
      subject.category = nil
      expect(subject).to_not be_valid 
    end
  end
end
