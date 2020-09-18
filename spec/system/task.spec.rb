require 'rails_helper'
  RSpec.describe 'task management features', type: :system do

  before do
    # Create two tasks to be used in a pre-test of the task list

    Task.create!(name: 'test_task_01', detail: 'test_content_01')
    Task.create!(name: 'test_task_02', detail: 'test_content_01')
  end

  describe 'Create new feature' do
    context 'If you create a new task' do
      It 'displays the tasks you have created' do
      end
    end
  end
  describe 'List function' do
    context 'If you go to the list screen' do
      it 'Displays the list of created tasks' do
        task = FactoryBot.create(:second_task, name: 'task')
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
  end
  describe 'Show Details' do
      context 'When you go to any task detail screen' do
        It 'displays the content of the relevant task' do
        end
      end
  end
  end

end