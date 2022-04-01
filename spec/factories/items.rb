FactoryBot.define do
  factory :item do
    name                  {'オムライス'}
    detail                {'美味しい'}
    category_id           {'2'}
    status_id             {'2'}
    delivery_charge_id    {'2'}
    delivery_area_id      {'2'}
    delivery_date_id      {'2'}
    price                 {'500'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'),filename: 'test_image.jpg')
    end
  end
end