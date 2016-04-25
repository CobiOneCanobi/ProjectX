FactoryGirl.define do
  factory :presentation do
    video    {'https://www.youtube.com/watch?v=i_2Hh-UGm8I'}
    goal     {Faker::Lorem.sentence(3)}
    about    {Faker::Lorem.paragraph(3)}
    category {Category.offset(rand(Category.count)).first}
  end
end
