#bundle exec rspec spec/system/label_spec.rb

require 'rails_helper'
require 'selenium-webdriver'
RSpec.describe 'label Management Function', type: :system do
  before do
    @user =FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)

    @label1 = FactoryBot.create(:label1, user:@user)
    @label2 = FactoryBot.create(:label2, user:@user)

    FactoryBot.create(:task, user: @user)
    FactoryBot.create(:second_task, user: @user)

    visit new_session_path
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_button 'Log in'
  end

  describe 'Label managing' do
    context 'If the label is not registered' do
      it 'regriter Labels in Tasks' do
        visit new_task_path
        fill_in 'task_name', with: 'task1'
        fill_in 'task_detail', with: 'detail1'
        select 'low', from: 'task_priority'
        select 'not_yet', from: 'task_status'
        #binding.irb
        find(:label, 'label1').click
        click_on 'Create Task'

        expect(page).to have_content 'label1'
      end
      it 'Register Multiple Labels in a Task' do
        visit new_task_path
        fill_in 'task_name', with: 'task1'
        fill_in 'task_detail', with: 'detail1'
        select 'middle', from: 'task_priority'
        select 'in_progress', from: 'task_status'

        find(:label, 'label2').click

        click_on 'Create Task'
        expect(page).to have_content 'label2'
      end
    end
    context `If the task list is not sorted` do
      it 'Tasks can be searched by label.' do
          visit tasks_path
          select 'label1', from: 'label_id'
          find(:css, '#labelSearch').click
          click_on 'Search', match: :first
          expect(page).to have_content 'label1'
      end
    end
  end
end
