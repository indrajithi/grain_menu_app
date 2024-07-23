# Clear existing data in the correct order to avoid foreign key constraint issues
Modifier.destroy_all
ItemModifierGroup.destroy_all
ModifierGroup.destroy_all
SectionItem.destroy_all
Item.destroy_all
MenuSection.destroy_all
Section.destroy_all
Menu.destroy_all

# Create Menu
menu = Menu.create!(
  label: "Pizza Menu",
  state: "active",
  start_date: Date.today,
  end_date: Date.today + 1.month
)

# Create Sections
classic_pizzas_section = Section.create!(
  identifier: "classic-pizzas",
  label: "Classic Pizzas",
  description: "Our selection of classic pizzas."
)

specialty_pizzas_section = Section.create!(
  identifier: "specialty-pizzas",
  label: "Specialty Pizzas",
  description: "Our unique and specialty pizzas with customizable options."
)

# Link Sections to Menu
MenuSection.create!(menu: menu, section: classic_pizzas_section, display_order: 1)
MenuSection.create!(menu: menu, section: specialty_pizzas_section, display_order: 2)

# Create Non-Configurable Items
margherita_pizza = Item.create!(
  type: "product",
  identifier: "margherita-pizza",
  label: "Margherita Pizza",
  description: "A classic margherita pizza with tomato sauce, mozzarella, and basil.",
  price: 10.0
)

pepperoni_pizza = Item.create!(
  type: "product",
  identifier: "pepperoni-pizza",
  label: "Pepperoni Pizza",
  description: "A delicious pepperoni pizza with tomato sauce and mozzarella.",
  price: 12.0
)

# Link Non-Configurable Items to Section
SectionItem.create!(section: classic_pizzas_section, item: margherita_pizza, display_order: 1)
SectionItem.create!(section: classic_pizzas_section, item: pepperoni_pizza, display_order: 2)

# Create Configurable Item
bbq_chicken_pizza = Item.create!(
  type: "product",
  identifier: "bbq-chicken-pizza",
  label: "BBQ Chicken Pizza",
  description: "A tasty BBQ chicken pizza with customizable options.",
  price: 15.0
)

# Create Modifier Groups
size_modifier_group = ModifierGroup.create!(
  identifier: "size",
  label: "Size",
  selection_required_min: 1,
  selection_required_max: 1
)

extras_modifier_group = ModifierGroup.create!(
  identifier: "extras",
  label: "Extras",
  selection_required_min: 0,
  selection_required_max: 3
)

# Link Modifier Groups to Configurable Item
ItemModifierGroup.create!(item: bbq_chicken_pizza, modifier_group: size_modifier_group)
ItemModifierGroup.create!(item: bbq_chicken_pizza, modifier_group: extras_modifier_group)

# Create Modifiers for Modifier Groups
small_size_modifier = Modifier.create!(
  item: bbq_chicken_pizza,
  modifier_group: size_modifier_group,
  display_order: 1,
  default_quantity: 1,
  price_override: 0.0
)

medium_size_modifier = Modifier.create!(
  item: bbq_chicken_pizza,
  modifier_group: size_modifier_group,
  display_order: 2,
  default_quantity: 0,
  price_override: 2.0
)

large_size_modifier = Modifier.create!(
  item: bbq_chicken_pizza,
  modifier_group: size_modifier_group,
  display_order: 3,
  default_quantity: 0,
  price_override: 4.0
)

extra_cheese_modifier = Modifier.create!(
  item: bbq_chicken_pizza,
  modifier_group: extras_modifier_group,
  display_order: 1,
  default_quantity: 0,
  price_override: 1.0
)

extra_pepperoni_modifier = Modifier.create!(
  item: bbq_chicken_pizza,
  modifier_group: extras_modifier_group,
  display_order: 2,
  default_quantity: 0,
  price_override: 1.5
)

extra_olives_modifier = Modifier.create!(
  item: bbq_chicken_pizza,
  modifier_group: extras_modifier_group,
  display_order: 3,
  default_quantity: 0,
  price_override: 1.0
)

# Link Configurable Item to Section
SectionItem.create!(section: specialty_pizzas_section, item: bbq_chicken_pizza, display_order: 1)

puts "Seeding completed successfully!"
