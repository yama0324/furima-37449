FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000a'}
    password_confirmation {password}
    first_name            {'山森'}
    last_name             {'諄也'}
  end
end