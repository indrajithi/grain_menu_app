FactoryBot.define do
  factory :modifier_group do
    identifier { "MyString" }
    label { "MyString" }
    selection_required_min { 1 }
    selection_required_max { 1 }
  end
end
