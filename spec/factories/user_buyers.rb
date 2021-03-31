FactoryBot.define do
  factory :user_buyer do
    postal_code    {'123-4567'}
    prefecture_id  {2}
    city      {'横浜市'}
    block     {'神奈川区1'}
    building_name  {'テストビル'}
    phone_number   {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    user_id  {1}
    item_id  {1}
  end
end
