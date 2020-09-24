require 'rails_helper'

RSpec.describe Task, type: :model do
  require 'rails_helper'
  describe 'task model features', type: :model do
    describe 'Test validation' do
      context 'If the task title is empty' do
        it 'gets caught in the validation' do
          task = Task.new(name: '', detail: 'failure test')
          expect(task).not_to be_valid
        end
      end
    
      context 'if the task details are empty' do
        it 'gets caught in the validation' do
          # Here's what you need to know
          task = Task.new(name: 'Test from details', detail: '')
          expect(task).not_to be_valid
        end
      end
      context 'if the title and details of the task are described in detail' do
        it 'validation passes' do
          # Here's what you need to know
          task = Task.new(name: 'hogehoge', detail: 'gehogeho', deadline: '2020-01-01', status: 'in_progress', priority: 'high')
          expect(task).to be_valid
        end
      end
    end

    describe 'search function' do
      # You can change the content of the test data as needed.
      FactoryBot.create(:task, name: "task")
      FactoryBot.create(:second_task, name: "test")
      context 'ambiguous title search in the scopes method' do
        it "will narrow down the tasks that contain the search terms" do
          # binding.pry
          # name_seach is a method for title search as provided by scopes. The name of the method can be arbitrary.
          # expect(Task.name_search('task')).to include(task)
          # expect(Task.name_search('task')).not_to include(second_task)
          # expect(Task.name_search('task').count).to eq 1
        end
      end
      context 'If you do a status search using the scope method' do
        it "narrows down the tasks that exactly match the status" do
        end
      end
  
      context 'ambiguous title and status search in the scopes method' do
        it "Include your search term in the title and be task specific to your status" do
        end
      end
    end
  end
end
