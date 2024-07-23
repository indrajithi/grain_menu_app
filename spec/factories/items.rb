FactoryBot.define do
  factory :item do
    type { "Product" }
    identifier { "MyString" }
    label { "MyString" }
    description { "MyString" }
    price { 1.5 }
  end
end
