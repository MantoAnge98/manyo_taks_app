require 'rails_helper'
  RSpec.describe 'task management features', type: :system do

  before do
    FactoryBot.create(:user)
    FactoryBot.create(:task, user: user)
    visit tasks_path
  end
  describe 'search function' do
    before do
      # You can change the content of the test data as needed.
      FactoryBot.create(:task, name: "task")
      FactoryBot.create(:second_task, name: "test")
      FactoryBot.create(:third_task, name: "task3")
    end
    context 'If you do a fuzzy search on the title' do
      it "will be narrowed down by tasks containing search terms" do
        visit tasks_path
        # Enter a search term in the task search field (e.g. task)
        fill_in 'task_name', with: 'task'
        # Press the search button.
        click_on 'Search' 
        expect(page).to have_content 'task'
      end
    end
    context 'If you do a status search' do
      It "narrows down the tasks that exactly match the status" do
        visit tasks_path
        # Find out about the "select" to select a pull-down to implement here.
        select "not started", from: "task_status"
        click_on 'Search'
        expect(page).to have_content 'not started'
      end
    end
    context 'For ambiguous title and status searches' do
      it "Include your search term in the title and be task specific to your status" do
        visit tasks_path
        # Implement here.
        fill_in 'task_name', with: 'test'
        select "not started", from: "task_status"
        click_on 'Search'
        expect(page).to have_content 'test'
        expect(page).to have_content 'not started'
      end
    end
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
        task = FactoryBot.create(:task, name: 'task')
        task = FactoryBot.create(:second_task, name: 'task2')
        visit tasks_path
        task_list= all('.task_list')
        # The string "task" is displayed in the visited (transited) page (task list page) as
        # Expect to have_content (check/expect to be included)
        expect(page).to have_content 'task'
        expect(page).to_not have_content 'Default content created by Factory3'
        expect(page).to have_content 'Default content 2 created by Factory'
        # The result of expectation is output as a successful test if the result is true, or as a failure if false.                
      end
    end
    #Add content in the test issues#2
    context 'If the tasks are arranged in descending order by creation date' do
      it 'New tasks appear at the top' do
        task = FactoryBot.create(:task, name: 'task')
        task = FactoryBot.create(:second_task, name: 'task2')
        task = FactoryBot.create(:third_task, name: 'task3')
        visit tasks_path
        task_list= all('.task_list')
        save_and_open_page
        expect(task_list[0]).to have_content 'task3'
        expect(task_list[1]).to have_content 'task2'
        expect(task_list[2]).to have_content 'task'     
      end
    end

    context 'Sort by end date' do
      it 'Tasks are in order of their end date' do
      end
    end 

    context 'Sort by priority' do
      it 'ordered by priority' do        
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