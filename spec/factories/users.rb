FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.free_email }
    password              {'000000a'}
    password_confirmation {password}
    first_name            {'山森'}
    last_name             {'諄也'}
    first_name_kana       {'ヤマモリ'}
    last_name_kana        {'ジュンヤ'}
    birthday              {'1991-03-24'}
  end
end