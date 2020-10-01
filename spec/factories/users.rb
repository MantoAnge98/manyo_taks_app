FactoryBot.define do
  factory :user do
    name { "user" }
    email { "user@gmail.com" }
    password{ "000000" }
    password_confirmation{ "000000" }
    admin {false}
  end

  factory :second_user, class: User do
    name { "user2" }
    email { "user2@gmail.com" }
    password{ "000000" }
    password_confirmation{ "000000" }
    admin {false}
  end

  factory :third_user, class: User do
    name { "user3" }
    email { "user3@gmail.com" }
    password{ "000000" }
    password_confirmation{ "000000" }
    admin {false}
  end


  factory :admin_user, class: User do
    name { "admin" }
    email { "admin@gmail.com" }
    password { "000000" }
    password_confirmation{ "000000" }
    admin {true}
  end
end
