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
  end

  describe '.authenticate_with_credentials' do 
    subject {
      described_class.new(
        first_name: "Anything", 
        last_name: 'Name',           
        email: 'email@mail.bail', 
        password: '12345678', 
        password_confirmation: '12345678')
    }
    it 'authenticates a user with valid credentials' do 
      subject.save! 
      expect(described_class.authenticate_with_credentials(subject.email, subject.password)).to eql(subject)
    end 

    it 'authenticates a user with wrong case email with spaces' do 
      subject.save! 
      expect(described_class.authenticate_with_credentials(' EMAIL@MAIL.BaIl', subject.password)).to eql(subject)
    end 

    it 'returns nil for a user with the wrong credentials' do 
      subject.save! 
      expect(described_class.authenticate_with_credentials('MAIL@MAIL.BaIl', 'wrongpass')).to eql(nil)
    end 

  end 
end
