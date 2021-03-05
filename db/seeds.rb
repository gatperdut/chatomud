# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


puts "Seeding data..."
puts "map (superareas, areas & rooms)"
require File.join(Rails.root, "db", "seeds", "map", "01_superareas.rb")
require File.join(Rails.root, "db", "seeds", "map", "02_areas.rb")
require File.join(Rails.root, "db", "seeds", "map", "03_rooms_01.rb")
require File.join(Rails.root, "db", "seeds", "map", "03_rooms_02.rb")
require File.join(Rails.root, "db", "seeds", "map", "03_rooms_03.rb")
require File.join(Rails.root, "db", "seeds", "map", "03_rooms_04.rb")
require File.join(Rails.root, "db", "seeds", "map", "04_doors.rb")

puts "players"
require File.join(Rails.root, "db", "seeds", "players", "01_players.rb")

puts "characters"
require File.join(Rails.root, "db", "seeds", "characters", "01_pcs.rb")
require File.join(Rails.root, "db", "seeds", "characters", "02_npcs.rb")

puts "item templates"
require File.join(Rails.root, "db", "seeds", "item_templates", "01_general.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "02_melee_weapons.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "03_armor.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "04_shield.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "05_quivers.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "06_missiles.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "07_ranged_weapons.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "08_horns.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "09_fuels.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "10_light_sources.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "11_books.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "12_writings.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "13_boards.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "14_writing_implements.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "15_ink_sources.rb")
require File.join(Rails.root, "db", "seeds", "item_templates", "20_crafting.rb")

puts "items"
require File.join(Rails.root, "db", "seeds", "items", "01_general.rb")
require File.join(Rails.root, "db", "seeds", "items", "02_melee_weapons.rb")
require File.join(Rails.root, "db", "seeds", "items", "03_armor.rb")
require File.join(Rails.root, "db", "seeds", "items", "04_shield.rb")
require File.join(Rails.root, "db", "seeds", "items", "05_quivers.rb")
require File.join(Rails.root, "db", "seeds", "items", "06_missiles.rb")
require File.join(Rails.root, "db", "seeds", "items", "07_ranged_weapons.rb")
require File.join(Rails.root, "db", "seeds", "items", "08_horns.rb")
require File.join(Rails.root, "db", "seeds", "items", "09_fuels.rb")
require File.join(Rails.root, "db", "seeds", "items", "10_light_sources.rb")
require File.join(Rails.root, "db", "seeds", "items", "11_books.rb")
require File.join(Rails.root, "db", "seeds", "items", "12_writings.rb")
require File.join(Rails.root, "db", "seeds", "items", "13_boards.rb")
require File.join(Rails.root, "db", "seeds", "items", "14_writing_implements.rb")
require File.join(Rails.root, "db", "seeds", "items", "15_ink_sources.rb")

puts "crafts"
require File.join(Rails.root, "db", "seeds", "crafts", "01_metalworking.rb")

puts "furniture templates"
require File.join(Rails.root, "db", "seeds", "furniture_templates", "01_tables.rb")
require File.join(Rails.root, "db", "seeds", "furniture_templates", "02_cupboards.rb")

puts "pieces of furniture"
require File.join(Rails.root, "db", "seeds", "furnitures", "01_tables.rb")
require File.join(Rails.root, "db", "seeds", "furnitures", "02_cupboards.rb")

puts "character templates"
require File.join(Rails.root, "db", "seeds", "character_templates", "01_character_templates.rb")

puts "character applications"
require File.join(Rails.root, "db", "seeds", "character_applications", "01_character_applications.rb")

puts "outfitters"
require File.join(Rails.root, "db", "seeds", "outfitters", "01_item_outfitters.rb")
require File.join(Rails.root, "db", "seeds", "outfitters", "02_character_outfitters.rb")

puts "announcements"
require File.join(Rails.root, "db", "seeds", "announcements", "01_announcements.rb")

puts "attributes & skills static tables"
require File.join(Rails.root, "db", "seeds", "tables", "01_attribute_bonuses.rb")
require File.join(Rails.root, "db", "seeds", "tables", "02_category_ranks.rb")
require File.join(Rails.root, "db", "seeds", "tables", "03_ranks.rb")
require File.join(Rails.root, "db", "seeds", "tables", "04_skill_categories.rb")
require File.join(Rails.root, "db", "seeds", "tables", "05_skills.rb")
require File.join(Rails.root, "db", "seeds", "tables", "06_protections.rb")

puts "frames static tables"
require File.join(Rails.root, "db", "seeds", "tables", "frames", "01_base_frames.rb")
require File.join(Rails.root, "db", "seeds", "tables", "frames", "02_frame_modifiers.rb")

puts "criticals static tables..."
require File.join(Rails.root, "db", "seeds", "tables", "criticals", "slash.rb")

# require File.join(Rails.root, "db", "seeds", "weapon_attacks.rb")

puts "Done seeding."
