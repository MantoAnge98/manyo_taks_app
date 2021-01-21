require 'rails_helper'

RSpec.describe Label, type: :model do
  describe 'task model features', type: :model do
    let(:user) {FactoryBot.create(:user, email:'user@gmail.com')  } 
    describe 'label model features', type: :model do
      context 'If the name  is empty' do
        it 'gets caught in the validation' do
          label = Label.new(name: '',)
          expect(label).not_to be_valid
        end
      end
    context 'if the name of label are described' do
        it 'validation passes' do
          # Here's what you need to know
          label = Label.new( name: 'name', user: user)
          expect(label).to be_valid
        end
      end
    end
  end
end
