require "chato_mud/mixins/characters/attribute_set/definition"
require "chato_mud/mixins/characters/skill_set/utils"

require "chato_mud/mixins/grips/definition"
require "chato_mud/mixins/characters/skill_set/definition"
require "chato_mud/mixins/ranges/definition"
require "chato_mud/mixins/missile/definition"

require "chato_mud/mixins/slots/definition"
require "chato_mud/mixins/armor/definition"
require "chato_mud/mixins/weapons/definition"
require "chato_mud/mixins/body_parts/definition"

require "chato_mud/mixins/fluids/definition"

require "chato_mud/mixins/crafts/ingredients/definition"

class ConstantsController < ApplicationController

  include ChatoMud::Mixins::Characters::AttributeSet::Definition
  include ChatoMud::Mixins::Characters::SkillSet::Utils

  include ChatoMud::Mixins::Grips::Definition
  include ChatoMud::Mixins::Characters::SkillSet::Definition
  include ChatoMud::Mixins::Ranges::Definition
  include ChatoMud::Mixins::Missile::Definition

  include ChatoMud::Mixins::Slots::Definition
  include ChatoMud::Mixins::Armor::Definition
  include ChatoMud::Mixins::Weapons::Definition
  include ChatoMud::Mixins::BodyParts::Definition

  include ChatoMud::Mixins::Fluids::Definition

  include ChatoMud::Mixins::Crafts::Ingredients::Definition

  def all
    render json: {
      weapons:          weapons,
      armor:            armor,
      fluids:           fluids,
      ingredients:      ingredients,
      skills:           skills,
      skill_categories: skill_categories,
      attributes:       attributes
    }
  end

  private

  def weapons
    {
      grips:           all_grips,
      melee_bases:     all_melee_bases,
      ranged_bases:    all_ranged_bases,
      all_bases:       all_weapon_bases,
      melee_skills:    all_melee_skills,
      ranged_skills:   all_ranged_skills,
      skill_per_base:  skill_per_weapon_base,
      missile_types:   all_missile_types,
      missile_ranges:  all_ranges
    }
  end

  def armor
    {
      slots:                     regular_slots,
      body_parts:                all_body_parts,
      maneuver_impediments:      all_maneuver_impediments,
      ranged_attack_impediments: all_ranged_attack_impediments
    }
  end

  # TODO: need to expose colors, weights per unit, etc.
  def fluids
    all_fluids
  end

  def ingredients
    {
      usage_types: all_craft_ingredient_usage_types,
      locations:   all_craft_ingredient_locations
    }
  end

  def skills
    {
      list: {
        all:           Skill.all,
        melee:         Skill.where(skill_category: "melee"),
        ranged:        Skill.where(skill_category: "ranged"),
        martial:       Skill.where(skill_category: "martial"),
        athletics:     Skill.where(skill_category: "athletics"),
        communication: Skill.where(skill_category: "communication"),
        forging:       Skill.where(skill_category: "forging")
      },
      names: {
        all:           Skill.all.pluck(:name),
        melee:         Skill.where(skill_category: "melee").pluck(:name),
        ranged:        Skill.where(skill_category: "ranged").pluck(:name),
        martial:       Skill.where(skill_category: "martial").pluck(:name),
        athletics:     Skill.where(skill_category: "athletics").pluck(:name),
        communication: Skill.where(skill_category: "communication").pluck(:name),
        forging:       Skill.where(skill_category: "forging").pluck(:name)
      },
      # TODO: need to expose breaking points
      labels: all_skill_labels,
      ranks: {
        limited:       Rank.where(rate: "limited"),
        below_average: Rank.where(rate: "below_average"),
        standard:      Rank.where(rate: "standard"),
        above_average: Rank.where(rate: "above_average"),
        plus:          Rank.where(rate: "plus")
      }
    }
  end

  def skill_categories
    {
      all:   SkillCategory.all,
      names: SkillCategory.all.pluck(:name),
      ranks: {
        limited:       CategoryRank.where(rate: "limited"),
        below_average: CategoryRank.where(rate: "below_average"),
        standard:      CategoryRank.where(rate: "standard"),
        above_average: CategoryRank.where(rate: "above_average"),
        plus:          CategoryRank.where(rate: "plus")
      }
    }
  end

  def attributes
    {
      list: all_attributes,
      bonus: AttributeBonus.all
    }
  end

end
