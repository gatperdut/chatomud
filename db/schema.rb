# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_01_01_016000) do

  create_table "aasm_templates", force: :cascade do |t|
    t.integer "code", default: 0, null: false
    t.integer "character_template_id", null: false
    t.index ["character_template_id"], name: "index_aasm_templates_on_character_template_id"
  end

  create_table "aasms", force: :cascade do |t|
    t.integer "code", default: 0, null: false
    t.integer "character_id"
    t.boolean "active", default: true, null: false
    t.index ["character_id"], name: "index_aasms_on_character_id"
  end

  create_table "amount_data", force: :cascade do |t|
    t.integer "amount_id", null: false
    t.integer "fluid"
    t.integer "calories"
    t.integer "hydration"
    t.index ["amount_id"], name: "index_amount_data_on_amount_id"
  end

  create_table "amount_data_templates", force: :cascade do |t|
    t.integer "amount_template_id", null: false
    t.integer "fluid"
    t.integer "calories"
    t.integer "hydration"
    t.index ["amount_template_id"], name: "index_amount_data_templates_on_amount_template_id"
  end

  create_table "amount_templates", force: :cascade do |t|
    t.integer "current", null: false
    t.integer "max", null: false
    t.integer "stackable_id"
    t.integer "edible_id"
    t.integer "fillable_id"
    t.integer "fuelable_id"
    t.index ["edible_id"], name: "index_amount_templates_on_edible_id"
    t.index ["fillable_id"], name: "index_amount_templates_on_fillable_id"
    t.index ["fuelable_id"], name: "index_amount_templates_on_fuelable_id"
    t.index ["stackable_id"], name: "index_amount_templates_on_stackable_id"
  end

  create_table "amounts", force: :cascade do |t|
    t.integer "current", null: false
    t.integer "max", null: false
    t.integer "stackable_id"
    t.integer "edible_id"
    t.integer "fillable_id"
    t.integer "fuelable_id"
    t.index ["edible_id"], name: "index_amounts_on_edible_id"
    t.index ["fillable_id"], name: "index_amounts_on_fillable_id"
    t.index ["fuelable_id"], name: "index_amounts_on_fuelable_id"
    t.index ["stackable_id"], name: "index_amounts_on_stackable_id"
  end

  create_table "announcements", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.integer "superarea_id", null: false
    t.index ["superarea_id"], name: "index_areas_on_superarea_id"
  end

  create_table "armor_stat_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.integer "protection_level", null: false
    t.integer "penalty_level", null: false
    t.integer "roll_mod", default: 0, null: false
    t.integer "critical_mod", default: 0, null: false
    t.integer "maneuver_impediment", null: false
    t.integer "ranged_attack_impediment", null: false
    t.string "body_parts", default: "--- []\n", null: false
    t.index ["item_template_id"], name: "index_armor_stat_templates_on_item_template_id"
  end

  create_table "armor_stats", force: :cascade do |t|
    t.integer "item_id"
    t.integer "protection_level", null: false
    t.integer "penalty_level", null: false
    t.integer "roll_mod", default: 0, null: false
    t.integer "critical_mod", default: 0, null: false
    t.integer "maneuver_impediment", null: false
    t.integer "ranged_attack_impediment", null: false
    t.string "body_parts", default: "--- []\n", null: false
    t.index ["item_id"], name: "index_armor_stats_on_item_id"
  end

  create_table "attacks", force: :cascade do |t|
    t.boolean "connects", default: true, null: false
    t.integer "score_limit", null: false
    t.integer "base", null: false
    t.integer "against", null: false
    t.integer "hits", null: false
    t.integer "critical_severity", null: false
    t.integer "critical_type", null: false
  end

  create_table "attribute_bonus", force: :cascade do |t|
    t.integer "limit", null: false
    t.integer "bonus", null: false
    t.string "label", null: false
  end

  create_table "attribute_set_templates", force: :cascade do |t|
    t.integer "character_template_id", null: false
    t.string "preference", default: "--- []\n", null: false
    t.index ["character_template_id"], name: "index_attribute_set_templates_on_character_template_id"
  end

  create_table "attribute_sets", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "str", default: 1, null: false
    t.integer "con", default: 1, null: false
    t.integer "agi", default: 1, null: false
    t.integer "dex", default: 1, null: false
    t.integer "int", default: 1, null: false
    t.integer "wil", default: 1, null: false
    t.integer "pow", default: 1, null: false
    t.index ["character_id"], name: "index_attribute_sets_on_character_id"
  end

  create_table "base_frames", force: :cascade do |t|
    t.integer "race", default: 0, null: false
    t.integer "score_limit", default: 0, null: false
    t.integer "height", default: 0, null: false
    t.integer "weight", default: 0, null: false
    t.integer "label", default: 0, null: false
    t.integer "column", default: 0, null: false
  end

  create_table "board_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.index ["item_template_id"], name: "index_board_templates_on_item_template_id"
  end

  create_table "boards", force: :cascade do |t|
    t.integer "item_id", null: false
    t.index ["item_id"], name: "index_boards_on_item_id"
  end

  create_table "book_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.integer "page_count", default: 10, null: false
    t.index ["item_template_id"], name: "index_book_templates_on_item_template_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "page_count", default: 10, null: false
    t.integer "current_page"
    t.index ["item_id"], name: "index_books_on_item_id"
  end

  create_table "category_ranks", force: :cascade do |t|
    t.integer "rate", default: 0, null: false
    t.integer "value", null: false
    t.integer "bonus", null: false
  end

  create_table "character_applications", force: :cascade do |t|
    t.integer "player_id"
    t.string "name", null: false
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords"
    t.string "skill_picks"
    t.index ["player_id"], name: "index_character_applications_on_player_id"
  end

  create_table "character_outfitters", force: :cascade do |t|
    t.text "item_template_codes", null: false
    t.string "code", null: false
  end

  create_table "character_templates", force: :cascade do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "image"
    t.string "code", null: false
    t.string "names", null: false
    t.string "noun", null: false
    t.string "short_descs", null: false
    t.string "long_desc_endings", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "image"
    t.string "kwords"
    t.boolean "npc", default: false, null: false
    t.boolean "gladiator", default: false, null: false
    t.string "gifts", default: "--- []\n", null: false
    t.boolean "active", default: false, null: false
    t.integer "player_id"
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_characters_on_player_id"
    t.index ["room_id"], name: "index_characters_on_room_id"
  end

  create_table "choice_templates", force: :cascade do |t|
    t.integer "character_template_id", null: false
    t.integer "stance", default: 3, null: false
    t.integer "pace", default: 2, null: false
    t.boolean "editor_echoes", default: true, null: false
    t.integer "language", default: 0, null: false
    t.integer "script", default: 0, null: false
    t.index ["character_template_id"], name: "index_choice_templates_on_character_template_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "stance", default: 3, null: false
    t.integer "pace", default: 2, null: false
    t.boolean "editor_echoes", default: true, null: false
    t.integer "language", default: 0, null: false
    t.integer "script", default: 0, null: false
    t.index ["character_id"], name: "index_choices_on_character_id"
  end

  create_table "craft_ingredients", force: :cascade do |t|
    t.integer "craft_id", null: false
    t.text "item_template_codes", null: false
    t.integer "location", default: 0, null: false
    t.integer "usage_type", default: 0, null: false
    t.integer "how_many", default: 1, null: false
    t.index ["craft_id"], name: "index_craft_ingredients_on_craft_id"
  end

  create_table "craft_item_results", force: :cascade do |t|
    t.integer "craft_step_id", null: false
    t.string "item_template_code", null: false
    t.integer "how_many"
    t.integer "skill"
    t.index ["craft_step_id"], name: "index_craft_item_results_on_craft_step_id"
  end

  create_table "craft_steps", force: :cascade do |t|
    t.integer "craft_id", null: false
    t.string "echo_first", null: false
    t.string "echo_third", null: false
    t.string "fail_first"
    t.string "fail_third"
    t.integer "delay", null: false
    t.index ["craft_id"], name: "index_craft_steps_on_craft_id"
  end

  create_table "craft_tests", force: :cascade do |t|
    t.integer "craft_step_id", null: false
    t.integer "skill", default: 0, null: false
    t.integer "modifier", null: false
    t.index ["craft_step_id"], name: "index_craft_tests_on_craft_step_id"
  end

  create_table "crafts", force: :cascade do |t|
    t.string "name", null: false
    t.string "category", null: false
    t.index ["category"], name: "index_crafts_on_category"
    t.index ["name"], name: "index_crafts_on_name"
  end

  create_table "criticals", force: :cascade do |t|
    t.integer "damage_type", null: false
    t.integer "severity", null: false
    t.integer "score_limit", null: false
    t.integer "extra_hits", null: false
    t.integer "blood_loss", null: false
    t.integer "attack_stun_type", null: false
    t.integer "attack_stun_rounds", null: false
    t.integer "attack_stun_penalty", null: false
    t.integer "parry_stun_type", null: false
    t.integer "parry_stun_rounds", null: false
    t.integer "parry_stun_penalty", null: false
    t.string "message", null: false
    t.index ["damage_type", "severity", "score_limit"], name: "index_criticals_on_damage_type_and_severity_and_score_limit"
  end

  create_table "doors", force: :cascade do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.boolean "open", default: false, null: false
    t.boolean "see_through", default: false, null: false
    t.integer "nr_id"
    t.integer "er_id"
    t.integer "sr_id"
    t.integer "wr_id"
    t.integer "ur_id"
    t.integer "dr_id"
    t.index ["dr_id"], name: "index_doors_on_dr_id"
    t.index ["er_id"], name: "index_doors_on_er_id"
    t.index ["nr_id"], name: "index_doors_on_nr_id"
    t.index ["sr_id"], name: "index_doors_on_sr_id"
    t.index ["ur_id"], name: "index_doors_on_ur_id"
    t.index ["wr_id"], name: "index_doors_on_wr_id"
  end

  create_table "frame_modifiers", force: :cascade do |t|
    t.integer "race", default: 0, null: false
    t.integer "gender", default: 0, null: false
    t.integer "label", default: 0, null: false
    t.integer "score_limit", default: 0, null: false
    t.integer "modifier", default: 0, null: false
  end

  create_table "furniture_templates", force: :cascade do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords", default: "--- []\n", null: false
    t.string "code", null: false
    t.integer "max_seats", default: 0, null: false
  end

  create_table "furnitures", force: :cascade do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords", default: "--- []\n", null: false
    t.integer "max_seats", default: 0, null: false
    t.integer "room_id", null: false
    t.integer "furniture_template_id", null: false
    t.index ["furniture_template_id"], name: "index_furnitures_on_furniture_template_id"
    t.index ["room_id"], name: "index_furnitures_on_room_id"
  end

  create_table "health_templates", force: :cascade do |t|
    t.integer "character_template_id", null: false
    t.index ["character_template_id"], name: "index_health_templates_on_character_template_id"
  end

  create_table "healths", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "exhaustion", default: 0, null: false
    t.index ["character_id"], name: "index_healths_on_character_id"
  end

  create_table "horn_properties", force: :cascade do |t|
    t.integer "item_id"
    t.string "echo", null: false
    t.string "action_echo_self", null: false
    t.string "action_echo_others", null: false
    t.integer "reach", default: 0, null: false
    t.index ["item_id"], name: "index_horn_properties_on_item_id"
  end

  create_table "horn_property_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.string "echo", null: false
    t.string "action_echo_self", null: false
    t.string "action_echo_others", null: false
    t.integer "reach", default: 0, null: false
    t.index ["item_template_id"], name: "index_horn_property_templates_on_item_template_id"
  end

  create_table "ink_source_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.integer "spawned_item_template_id"
    t.integer "ink_type", default: 0, null: false
    t.integer "charges", default: 0, null: false
    t.index ["item_template_id"], name: "index_ink_source_templates_on_item_template_id"
    t.index ["spawned_item_template_id"], name: "index_ink_source_templates_on_spawned_item_template_id"
  end

  create_table "ink_sources", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "ink_type", default: 0, null: false
    t.integer "charges", default: 0, null: false
    t.integer "spawned_item_template_id"
    t.index ["item_id"], name: "index_ink_sources_on_item_id"
    t.index ["spawned_item_template_id"], name: "index_ink_sources_on_spawned_item_template_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "parent_type", null: false
    t.integer "parent_id", null: false
    t.index ["parent_type", "parent_id"], name: "index_inventories_on_parent"
  end

  create_table "inventory_templates", force: :cascade do |t|
    t.string "parent_type", null: false
    t.integer "parent_id", null: false
    t.index ["parent_type", "parent_id"], name: "index_inventory_templates_on_parent"
  end

  create_table "item_outfitters", force: :cascade do |t|
    t.text "item_template_codes", null: false
    t.string "code", null: false
  end

  create_table "item_templates", force: :cascade do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords", default: "--- []\n", null: false
    t.string "code", null: false
    t.integer "weight", default: 0, null: false
    t.boolean "is_sheath", default: false, null: false
    t.boolean "is_quiver", default: false, null: false
    t.string "possible_slots", default: "--- []\n", null: false
  end

  create_table "item_templates_solid_fuel_req_templates", id: false, force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.integer "solid_fuel_req_template_id", null: false
    t.index ["item_template_id"], name: "index_itsfrt_on_it_id"
    t.index ["solid_fuel_req_template_id"], name: "index_itsfrt_on_sfrt_id"
  end

  create_table "item_templates_solid_fuel_reqs", id: false, force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.integer "solid_fuel_req_id", null: false
    t.index ["item_template_id"], name: "index_item_templates_solid_fuel_reqs_on_item_template_id"
    t.index ["solid_fuel_req_id"], name: "index_item_templates_solid_fuel_reqs_on_solid_fuel_req_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords", default: "--- []\n", null: false
    t.string "possible_slots", default: "--- []\n", null: false
    t.integer "slot", default: 0, null: false
    t.integer "weight", default: 0, null: false
    t.boolean "is_sheath", default: false, null: false
    t.boolean "is_quiver", default: false, null: false
    t.integer "containing_inventory_id", null: false
    t.integer "item_template_id", null: false
    t.index ["containing_inventory_id"], name: "index_items_on_containing_inventory_id"
    t.index ["item_template_id"], name: "index_items_on_item_template_id"
  end

  create_table "items_locks", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "lock_id", null: false
    t.index ["item_id"], name: "index_items_locks_on_item_id"
    t.index ["lock_id"], name: "index_items_locks_on_lock_id"
  end

  create_table "lid_templates", force: :cascade do |t|
    t.integer "inventory_template_id", null: false
    t.index ["inventory_template_id"], name: "index_lid_templates_on_inventory_template_id"
  end

  create_table "lids", force: :cascade do |t|
    t.boolean "open", default: false, null: false
    t.integer "inventory_id", null: false
    t.index ["inventory_id"], name: "index_lids_on_inventory_id"
  end

  create_table "light_source_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.boolean "lit", default: false, null: false
    t.boolean "must_be_held_to_light", default: false, null: false
    t.integer "efficiency", default: 720, null: false
    t.integer "burndown", default: 720, null: false
    t.index ["item_template_id"], name: "index_light_source_templates_on_item_template_id"
  end

  create_table "light_sources", force: :cascade do |t|
    t.integer "item_id"
    t.boolean "lit", default: false, null: false
    t.boolean "must_be_held_to_light", default: false, null: false
    t.integer "efficiency", default: 720, null: false
    t.integer "burndown", default: 720, null: false
    t.index ["item_id"], name: "index_light_sources_on_item_id"
  end

  create_table "liquid_fuel_req_templates", force: :cascade do |t|
    t.integer "light_source_template_id"
    t.string "options", default: "--- []\n", null: false
    t.index ["light_source_template_id"], name: "index_liquid_fuel_req_templates_on_light_source_template_id"
  end

  create_table "liquid_fuel_reqs", force: :cascade do |t|
    t.integer "light_source_id"
    t.string "options", default: "--- []\n", null: false
    t.index ["light_source_id"], name: "index_liquid_fuel_reqs_on_light_source_id"
  end

  create_table "lock_templates", force: :cascade do |t|
    t.string "parent_type", null: false
    t.integer "parent_id", null: false
    t.index ["parent_type", "parent_id"], name: "index_lock_templates_on_parent"
  end

  create_table "locks", force: :cascade do |t|
    t.boolean "locked", default: true, null: false
    t.string "parent_type", null: false
    t.integer "parent_id", null: false
    t.index ["parent_type", "parent_id"], name: "index_locks_on_parent"
  end

  create_table "melee_stat_templates", force: :cascade do |t|
    t.integer "weapon_stat_template_id"
    t.string "sheathed_desc"
    t.index ["weapon_stat_template_id"], name: "index_melee_stat_templates_on_weapon_stat_template_id"
  end

  create_table "melee_stats", force: :cascade do |t|
    t.integer "weapon_stat_id"
    t.string "sheathed_desc"
    t.index ["weapon_stat_id"], name: "index_melee_stats_on_weapon_stat_id"
  end

  create_table "missile_stat_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.integer "missile_type", default: 0, null: false
    t.index ["item_template_id"], name: "index_missile_stat_templates_on_item_template_id"
  end

  create_table "missile_stats", force: :cascade do |t|
    t.integer "item_id"
    t.integer "missile_type", default: 0, null: false
    t.index ["item_id"], name: "index_missile_stats_on_item_id"
  end

  create_table "nourishments", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "calories", default: 0, null: false
    t.integer "hydration", default: 0, null: false
    t.index ["character_id"], name: "index_nourishments_on_character_id"
  end

  create_table "physical_attr_templates", force: :cascade do |t|
    t.string "parent_type", null: false
    t.integer "parent_id", null: false
    t.string "genders", default: "--- []\n", null: false
    t.integer "race", default: 0, null: false
    t.integer "height_category", default: 0, null: false
    t.integer "weight_category", default: 0, null: false
    t.index ["parent_type", "parent_id"], name: "index_physical_attr_templates_on_parent"
  end

  create_table "physical_attrs", force: :cascade do |t|
    t.integer "character_id"
    t.integer "gender", default: 0, null: false
    t.integer "race", default: 0, null: false
    t.integer "height", default: 0, null: false
    t.integer "weight", default: 0, null: false
    t.index ["character_id"], name: "index_physical_attrs_on_character_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "nickname", null: false
    t.string "image"
    t.string "email", null: false
    t.string "action_cable_uid", null: false
    t.integer "role", default: 0, null: false
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_players_on_confirmation_token", unique: true
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_players_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_players_on_unlock_token", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "parent_type", null: false
    t.integer "parent_id", null: false
    t.integer "page"
    t.string "title"
    t.text "content"
    t.index ["parent_type", "parent_id"], name: "index_posts_on_parent"
  end

  create_table "protections", force: :cascade do |t|
    t.integer "level", null: false
    t.integer "min_penalty", null: false
    t.integer "max_penalty", null: false
  end

  create_table "ranged_stat_templates", force: :cascade do |t|
    t.integer "weapon_stat_template_id"
    t.integer "missile_type", default: 0, null: false
    t.string "ranges_suitability", default: "--- []\n", null: false
    t.boolean "can_remain_loaded", default: false, null: false
    t.index ["weapon_stat_template_id"], name: "index_ranged_stat_templates_on_weapon_stat_template_id"
  end

  create_table "ranged_stats", force: :cascade do |t|
    t.integer "weapon_stat_id"
    t.integer "missile_type", default: 0, null: false
    t.string "ranges_suitability", default: "--- []\n", null: false
    t.boolean "can_remain_loaded", default: false, null: false
    t.index ["weapon_stat_id"], name: "index_ranged_stats_on_weapon_stat_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.integer "rate", default: 0, null: false
    t.integer "value", null: false
    t.integer "bonus", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.text "description_nighttime"
    t.integer "area_id", null: false
    t.boolean "arena", default: false, null: false
    t.boolean "always_lit", default: false, null: false
    t.boolean "enclosed", default: false, null: false
    t.float "roughness_multiplier", default: 1.0, null: false
    t.integer "nr_id"
    t.integer "er_id"
    t.integer "sr_id"
    t.integer "wr_id"
    t.integer "ur_id"
    t.integer "dr_id"
    t.integer "nd_id"
    t.integer "ed_id"
    t.integer "sd_id"
    t.integer "wd_id"
    t.integer "ud_id"
    t.integer "dd_id"
    t.index ["area_id"], name: "index_rooms_on_area_id"
    t.index ["dd_id"], name: "index_rooms_on_dd_id"
    t.index ["dr_id"], name: "index_rooms_on_dr_id"
    t.index ["ed_id"], name: "index_rooms_on_ed_id"
    t.index ["er_id"], name: "index_rooms_on_er_id"
    t.index ["nd_id"], name: "index_rooms_on_nd_id"
    t.index ["nr_id"], name: "index_rooms_on_nr_id"
    t.index ["sd_id"], name: "index_rooms_on_sd_id"
    t.index ["sr_id"], name: "index_rooms_on_sr_id"
    t.index ["ud_id"], name: "index_rooms_on_ud_id"
    t.index ["ur_id"], name: "index_rooms_on_ur_id"
    t.index ["wd_id"], name: "index_rooms_on_wd_id"
    t.index ["wr_id"], name: "index_rooms_on_wr_id"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "ansi_coloring", default: false, null: false
    t.integer "player_id", null: false
    t.index ["player_id"], name: "index_settings_on_player_id"
  end

  create_table "shield_stat_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.integer "variant", default: 0, null: false
    t.integer "quality_modifier", default: 0, null: false
    t.index ["item_template_id"], name: "index_shield_stat_templates_on_item_template_id"
  end

  create_table "shield_stats", force: :cascade do |t|
    t.integer "item_id"
    t.integer "variant", default: 0, null: false
    t.integer "quality_modifier", default: 0, null: false
    t.index ["item_id"], name: "index_shield_stats_on_item_id"
  end

  create_table "skill_categories", force: :cascade do |t|
    t.integer "name", null: false
    t.string "dependencies", default: "--- []\n", null: false
  end

  create_table "skill_set_templates", force: :cascade do |t|
    t.integer "character_template_id", null: false
    t.string "chosen", default: "--- []\n", null: false
    t.index ["character_template_id"], name: "index_skill_set_templates_on_character_template_id"
  end

  create_table "skill_sets", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "melee", default: 0, null: false
    t.integer "ranged", default: 0, null: false
    t.integer "martial", default: 0, null: false
    t.integer "athletics", default: 0, null: false
    t.integer "communication", default: 0, null: false
    t.integer "forging", default: 0, null: false
    t.integer "light_edge", default: 0, null: false
    t.integer "medium_edge", default: 0, null: false
    t.integer "heavy_edge", default: 0, null: false
    t.integer "medium_blunt", default: 0, null: false
    t.integer "heavy_blunt", default: 0, null: false
    t.integer "light_pierce", default: 0, null: false
    t.integer "medium_pierce", default: 0, null: false
    t.integer "polearm", default: 0, null: false
    t.integer "archery", default: 0, null: false
    t.integer "crossbow", default: 0, null: false
    t.integer "armor_use", default: 0, null: false
    t.integer "block", default: 0, null: false
    t.integer "parry", default: 0, null: false
    t.integer "dual_wield", default: 0, null: false
    t.integer "throwing", default: 0, null: false
    t.integer "body_development", default: 0, null: false
    t.integer "dodge", default: 0, null: false
    t.integer "brawl", default: 0, null: false
    t.integer "quenya", default: 0, null: false
    t.integer "telerin", default: 0, null: false
    t.integer "sindarin", default: 0, null: false
    t.integer "adunaic", default: 0, null: false
    t.integer "westron", default: 0, null: false
    t.integer "rohirric", default: 0, null: false
    t.integer "khuzdul", default: 0, null: false
    t.integer "entish", default: 0, null: false
    t.integer "valarin", default: 0, null: false
    t.integer "black_speech", default: 0, null: false
    t.integer "cirth", default: 0, null: false
    t.integer "sarati", default: 0, null: false
    t.integer "tengwar", default: 0, null: false
    t.integer "metalworking", default: 0, null: false
    t.index ["character_id"], name: "index_skill_sets_on_character_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "name", null: false
    t.integer "skill_category", null: false
    t.string "dependencies", default: "--- []\n", null: false
  end

  create_table "solid_fuel_req_templates", force: :cascade do |t|
    t.integer "light_source_template_id"
    t.index ["light_source_template_id"], name: "index_solid_fuel_req_templates_on_light_source_template_id"
  end

  create_table "solid_fuel_reqs", force: :cascade do |t|
    t.integer "light_source_id"
    t.index ["light_source_id"], name: "index_solid_fuel_reqs_on_light_source_id"
  end

  create_table "superareas", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "text_infos", force: :cascade do |t|
    t.string "parent_type", null: false
    t.integer "parent_id", null: false
    t.integer "character_id"
    t.integer "ink_type", default: 0, null: false
    t.integer "language", default: 0, null: false
    t.integer "script", default: 0, null: false
    t.integer "language_skill_mod"
    t.integer "script_skill_mod"
    t.index ["character_id"], name: "index_text_infos_on_character_id"
    t.index ["parent_type", "parent_id"], name: "index_text_infos_on_parent"
  end

  create_table "weapon_stat_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.integer "grip", default: 0, null: false
    t.integer "roll_mod", default: 0, null: false
    t.integer "critical_mod", default: 0, null: false
    t.integer "base", null: false
    t.index ["item_template_id"], name: "index_weapon_stat_templates_on_item_template_id"
  end

  create_table "weapon_stats", force: :cascade do |t|
    t.integer "item_id"
    t.integer "grip", default: 0, null: false
    t.integer "roll_mod", default: 0, null: false
    t.integer "critical_mod", default: 0, null: false
    t.integer "base", null: false
    t.index ["item_id"], name: "index_weapon_stats_on_item_id"
  end

  create_table "wounds", force: :cascade do |t|
    t.integer "damage", null: false
    t.integer "damage_type", null: false
    t.integer "body_part", null: false
    t.integer "health_id", null: false
    t.index ["health_id"], name: "index_wounds_on_health_id"
  end

  create_table "writing_implement_templates", force: :cascade do |t|
    t.integer "item_template_id", null: false
    t.boolean "single_use", default: false, null: false
    t.index ["item_template_id"], name: "index_writing_implement_templates_on_item_template_id"
  end

  create_table "writing_implements", force: :cascade do |t|
    t.integer "item_id", null: false
    t.boolean "charged", default: false, null: false
    t.integer "ink_type", default: 0, null: false
    t.boolean "single_use", default: false, null: false
    t.index ["item_id"], name: "index_writing_implements_on_item_id"
  end

  create_table "writings", force: :cascade do |t|
    t.integer "item_id", null: false
    t.boolean "wipeable", default: false, null: false
    t.index ["item_id"], name: "index_writings_on_item_id"
  end

  add_foreign_key "aasm_templates", "character_templates", on_delete: :cascade
  add_foreign_key "aasms", "characters", on_delete: :cascade
  add_foreign_key "amount_data", "amounts", on_delete: :cascade
  add_foreign_key "amount_data_templates", "amount_templates", on_delete: :cascade
  add_foreign_key "amount_templates", "item_templates", column: "edible_id", on_delete: :cascade
  add_foreign_key "amount_templates", "item_templates", column: "fillable_id", on_delete: :cascade
  add_foreign_key "amount_templates", "item_templates", column: "stackable_id", on_delete: :cascade
  add_foreign_key "amount_templates", "light_source_templates", column: "fuelable_id", on_delete: :cascade
  add_foreign_key "amounts", "items", column: "edible_id", on_delete: :cascade
  add_foreign_key "amounts", "items", column: "fillable_id", on_delete: :cascade
  add_foreign_key "amounts", "items", column: "stackable_id", on_delete: :cascade
  add_foreign_key "amounts", "light_sources", column: "fuelable_id", on_delete: :cascade
  add_foreign_key "areas", "superareas", on_delete: :cascade
  add_foreign_key "armor_stat_templates", "item_templates", on_delete: :cascade
  add_foreign_key "armor_stats", "items", on_delete: :cascade
  add_foreign_key "attribute_set_templates", "character_templates", on_delete: :cascade
  add_foreign_key "attribute_sets", "characters", on_delete: :cascade
  add_foreign_key "board_templates", "item_templates", on_delete: :cascade
  add_foreign_key "boards", "items", on_delete: :cascade
  add_foreign_key "book_templates", "item_templates", on_delete: :cascade
  add_foreign_key "books", "items", on_delete: :cascade
  add_foreign_key "characters", "players", on_delete: :cascade
  add_foreign_key "characters", "rooms", on_delete: :restrict
  add_foreign_key "choice_templates", "character_templates", on_delete: :cascade
  add_foreign_key "choices", "characters", on_delete: :cascade
  add_foreign_key "craft_ingredients", "crafts", on_delete: :cascade
  add_foreign_key "craft_item_results", "craft_steps", on_delete: :cascade
  add_foreign_key "craft_steps", "crafts", on_delete: :cascade
  add_foreign_key "craft_tests", "craft_steps", on_delete: :cascade
  add_foreign_key "doors", "rooms", column: "dr_id", on_delete: :nullify
  add_foreign_key "doors", "rooms", column: "er_id", on_delete: :nullify
  add_foreign_key "doors", "rooms", column: "nr_id", on_delete: :nullify
  add_foreign_key "doors", "rooms", column: "sr_id", on_delete: :nullify
  add_foreign_key "doors", "rooms", column: "ur_id", on_delete: :nullify
  add_foreign_key "doors", "rooms", column: "wr_id", on_delete: :nullify
  add_foreign_key "furnitures", "rooms", on_delete: :cascade
  add_foreign_key "health_templates", "character_templates", on_delete: :cascade
  add_foreign_key "healths", "characters", on_delete: :cascade
  add_foreign_key "horn_properties", "items", on_delete: :cascade
  add_foreign_key "horn_property_templates", "item_templates", on_delete: :cascade
  add_foreign_key "ink_source_templates", "item_templates", column: "spawned_item_template_id", on_delete: :cascade
  add_foreign_key "ink_source_templates", "item_templates", on_delete: :cascade
  add_foreign_key "ink_sources", "items", on_delete: :cascade
  add_foreign_key "item_templates_solid_fuel_req_templates", "item_templates", on_delete: :cascade
  add_foreign_key "item_templates_solid_fuel_req_templates", "solid_fuel_req_templates", on_delete: :cascade
  add_foreign_key "item_templates_solid_fuel_reqs", "item_templates", on_delete: :cascade
  add_foreign_key "item_templates_solid_fuel_reqs", "solid_fuel_reqs", on_delete: :cascade
  add_foreign_key "items", "inventories", column: "containing_inventory_id", on_delete: :cascade
  add_foreign_key "items", "item_templates", on_delete: :cascade
  add_foreign_key "items_locks", "items", on_delete: :cascade
  add_foreign_key "items_locks", "locks", on_delete: :cascade
  add_foreign_key "lid_templates", "inventory_templates", on_delete: :cascade
  add_foreign_key "lids", "inventories", on_delete: :cascade
  add_foreign_key "light_source_templates", "item_templates", on_delete: :cascade
  add_foreign_key "light_sources", "items", on_delete: :cascade
  add_foreign_key "melee_stat_templates", "weapon_stat_templates", on_delete: :cascade
  add_foreign_key "melee_stats", "weapon_stats", on_delete: :cascade
  add_foreign_key "missile_stat_templates", "item_templates", on_delete: :cascade
  add_foreign_key "missile_stats", "items", on_delete: :cascade
  add_foreign_key "nourishments", "characters", on_delete: :cascade
  add_foreign_key "physical_attrs", "characters", on_delete: :cascade
  add_foreign_key "ranged_stat_templates", "weapon_stat_templates", on_delete: :cascade
  add_foreign_key "ranged_stats", "weapon_stats", on_delete: :cascade
  add_foreign_key "rooms", "areas", on_delete: :cascade
  add_foreign_key "rooms", "doors", column: "dd_id", on_delete: :nullify
  add_foreign_key "rooms", "doors", column: "ed_id", on_delete: :nullify
  add_foreign_key "rooms", "doors", column: "nd_id", on_delete: :nullify
  add_foreign_key "rooms", "doors", column: "sd_id", on_delete: :nullify
  add_foreign_key "rooms", "doors", column: "ud_id", on_delete: :nullify
  add_foreign_key "rooms", "doors", column: "wd_id", on_delete: :nullify
  add_foreign_key "rooms", "rooms", column: "dr_id", on_delete: :nullify
  add_foreign_key "rooms", "rooms", column: "er_id", on_delete: :nullify
  add_foreign_key "rooms", "rooms", column: "nr_id", on_delete: :nullify
  add_foreign_key "rooms", "rooms", column: "sr_id", on_delete: :nullify
  add_foreign_key "rooms", "rooms", column: "ur_id", on_delete: :nullify
  add_foreign_key "rooms", "rooms", column: "wr_id", on_delete: :nullify
  add_foreign_key "settings", "players", on_delete: :cascade
  add_foreign_key "shield_stat_templates", "item_templates", on_delete: :cascade
  add_foreign_key "shield_stats", "items", on_delete: :cascade
  add_foreign_key "skill_set_templates", "character_templates", on_delete: :cascade
  add_foreign_key "skill_sets", "characters", on_delete: :cascade
  add_foreign_key "text_infos", "characters", on_delete: :nullify
  add_foreign_key "weapon_stat_templates", "item_templates", on_delete: :cascade
  add_foreign_key "weapon_stats", "items", on_delete: :cascade
  add_foreign_key "wounds", "healths", on_delete: :cascade
  add_foreign_key "writing_implement_templates", "item_templates", on_delete: :cascade
  add_foreign_key "writing_implements", "items", on_delete: :cascade
  add_foreign_key "writings", "items", on_delete: :cascade
end
