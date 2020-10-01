require 'rails_helper'
RSpec.describe Task, type: :model do
  describe 'task model features', type: :model do
    let(:user) {FactoryBot.create(:user, email:'user@gmail.com')  } 
    describe 'Test validation' do
      context 'If the task title is empty' do
        it 'gets caught in the validation' do
          task = Task.new(name: '', detail: 'failure test', user: user)
          expect(task).not_to be_valid
        end
      end
    
      context 'if the task details are empty' do
        it 'gets caught in the validation' do
          # Here's what you need to know
          task = Task.new(name: 'Test from details', detail: '', user: user)
          expect(task).not_to be_valid
        end
      end

      context 'if the title and details of the task are described in detail' do
        it 'validation passes' do
          # Here's what you need to know
          task = Task.new(name: 'hogehoge', detail: 'gehogeho', deadline: '2020-01-01', status: 'in_progress', priority: 'high', user: user)
          expect(task).to be_valid
        end
      end
    end

  end
end
