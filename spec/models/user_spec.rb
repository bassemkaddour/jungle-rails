require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(
        first_name: "Anything", 
        last_name: 'Name',           
        email: 'email@mail.bail', 
        password: '12345678', 
        password_confirmation: '12345678')
    }

    it 'is valid with valid attributes' do 
      expect(subject).to be_valid 
    end 

    it 'is not valid without email' do 
      subject.email = nil
      expect(subject).to_not be_valid 
    end

    it 'is not valid with a repeat email' do
      # subject.save!
      repeated_email = User.new(
        first_name: "Anything", 
        last_name: 'Name',           
        email: 'EMAIL@maIl.bail', 
        password: '12345678', 
        password_confirmation: '12345678')
      repeated_email.save!
      # expect(subject).to be_valid
      expect(subject).to_not be_valid

      # subject.save!
      # repeated_email = described_class.new(
      #   first_name: "Anything", 
      #   last_name: 'Name',           
      #   email: 'EMAIL@maIl.bail', 
      #   password: 'a', 
      #   password_confirmation: 'a')
      
      # # expect(subject).to be_valid
      # expect{ repeated_email.save! }.to raise_error(
      #   ActiveRecord::RecordInvalid
      # )
    end

    # it 'is not valid without quantity' do 
    #   subject.quantity = nil
    #   expect(subject).to_not be_valid 
    # end

    # it 'is not valid without category' do 
    #   subject.category = nil
    #   expect(subject).to_not be_valid 
    # end
  end
end
