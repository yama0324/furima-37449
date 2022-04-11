FactoryBot.define do
  factory :purchased_delivery_record do
    post_code                {'123-1234'}
    delivery_area_id         {'2'}
    city                     {'大和市'}
    address                  {'3'}
    building_name            {'アパホテル'}
    phone_number             {'09000000000'}
    token                    {'token {"tok_abcdefghijk00000000000000000"}'}
  end
end