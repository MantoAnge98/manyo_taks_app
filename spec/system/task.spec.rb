require 'rails_helper'
  RSpec.describe 'task management features', type: :system do

  before do
    # The code in before is executed at the time when context is executed, for example, 
    #when you go to the list screen or when the tasks are arranged in descending order of creation date.
    visit tasks_path
  end
  
  #before do
    # Create two tasks to be used in a pre-test of the task list
    #Task.create!(name: 'test_task_01', detail: 'test_content_01')
    #Task.create!(name: 'test_task_02', detail: 'test_content_01')
  #end

  describe 'Create new feature' do
    context 'If you create a new task' do
      it 'displays the tasks you have created' do
      end
    end
  end
  
  describe 'List function' do
    context 'If you go to the list screen' do
      it 'Displays the list of created tasks' do
        task = FactoryBot.create(:second_task, name: 'task')
        task = FactoryBot.create(:second_task, name: 'task2')
        visit tasks_path
        # The string "task" is displayed in the visited (transited) page (task list page) as
        # Expect to have_content (check/expect to be included)
        binding.irb
        expect(page).to have_content 'task'
        expect(page).to_not have_content 'Default content created by Factory3'
        expect(page).to have_content 'Default content 2 created by Factory'
        # The result of expectation is output as a successful test if the result is true, or as a failure if false.                
      end
    end
    #Add content in the test issues#2
    context 'If you go to the list screen' do
      it 'Displays the list of created tasks' do
        task = FactoryBot.create(:second_task, name: 'task')
        task = FactoryBot.create(:second_task, name: 'task2')
        visit tasks_path
        task_list= all('.task_list')
        save_and_open_page
        expect(task_list[0]).to have_content 'task2'
        expect(task_list[1]).to have_content 'task'   
      end
    end
  end
  describe 'Show Details' do
    context 'When you go to any task detail screen' do
      it 'displays the content of the relevant task' do
      end
    end
  end

end