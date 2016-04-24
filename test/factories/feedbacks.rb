FactoryGirl.define do
  factory :feedback do
    arr = ['Yes', 'No', 'Somewhat']

    rating    {arr.sample}
    comment   {Faker::Lorem.paragraph(2)}
  end
end
