# The statement "Use FactoryBot
FactoryBot.define do
  # Name the test data you are creating "task
  # (You can name the test data to match the name of a real class and it will automatically create test data for that class.
  factory :task do
    name { 'Default title 1 created in the Factory' }
    detail { 'Default content 1 created by Factory' }
  end
  # Name the test data to be created as "second_task
  # (To name a class name that does not exist, specify the option "Test data for this class")
  factory :second_task, class: Task do
    name { 'Default title 2 created in the Factory' }
    detail { 'Default content 2 created by Factory' }
  end
end