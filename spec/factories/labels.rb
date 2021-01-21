FactoryBot.define do
    factory :label do
      name { "MyString" }
      association :user
    end
    factory :label1, class: Label do
      name{ "label1"}
      association :user
    end
    factory :label2, class: Label do
      name{ "label2"}
      association :user
    end
    factory :label3, class: Label do
      name{ "label3"}
      association :user
    end
end
