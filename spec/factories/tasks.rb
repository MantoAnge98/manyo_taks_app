# The statement "Use FactoryBot
FactoryBot.define do
  # Name the test data you are creating "task
  # (You can name the test data to match the name of a real class and it will automatically create test data for that class.
  factory :task do
    name { 'Task1' }
    detail { 'Detail1' }
    deadline {DateTime.now}
    status {'completed'}
    priority {'high'}
    association :user
  end
  # Name the test data to be created as "second_task
  # (To name a class name that does not exist, specify the option "Test data for this class")
  factory :second_task, class: Task do
    name { 'Task2' }
    detail { 'Detail2' }
    deadline {DateTime.tomorrow}
    status {'not_yet'}
    priority {'middle'}
    association :user
  end

  factory :third_task, class: Task do
    name { 'Task3' }
    detail { 'Detail3'}
    deadline {DateTime.now.since(5.days)}
    status {'in_progress'}
    priority {'low'}
    association :user
  end
end 