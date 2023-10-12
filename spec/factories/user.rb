FactoryBot.define do
  factory :user do
    email { 'test@gmail.com' }
    name { 'Anna' }
    password { '123456' }
  end
end
