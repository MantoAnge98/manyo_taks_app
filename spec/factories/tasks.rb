# The statement "Use FactoryBot
FactoryBot.define do
  # Name the test data you are creating "task
  # (You can name the test data to match the name of a real class and it will automatically create test data for that class.
  factory :task do
    name { 'Default title 1 created in the Factory' }
    detail { 'Default content 1 created by Factory' }
    deadline {DateTime.now}
    status {'completed'}
    priority {'high'}
  end
  # Name the test data to be created as "second_task
  # (To name a class name that does not exist, specify the option "Test data for this class")
  factory :second_task, class: Task do
    name { 'Default title 2 created in the Factory' }
    detail { 'Default content 2 created by Factory' }
    deadline {DateTime.tomorrow}
    status {'not_yet'}
    priority {'middle'}
  end

  factory :third_task, class: Task do
    name { 'Default title 3 created in the Factory' }
    detail { 'Default content 3 created by Factory' }
    deadline {DateTime.now.since(5.days)}
    status {'in_progress'}
    priority {'low'}
  end
end 