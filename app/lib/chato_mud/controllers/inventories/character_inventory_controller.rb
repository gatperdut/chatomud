require "chato_mud/controllers/inventories/inventory_controller"

require "chato_mud/mixins/characters/inventory/finder"
require "chato_mud/mixins/characters/inventory/finder_itc"
require "chato_mud/mixins/characters/inventory/wearer"
require "chato_mud/mixins/characters/inventory/weapon_wielder"
require "chato_mud/mixins/characters/inventory/armored"
require "chato_mud/mixins/characters/inventory/holder"
require "chato_mud/mixins/characters/inventory/carrier"
require "chato_mud/mixins/characters/inventory/shield_user"
require "chato_mud/mixins/characters/inventory/melee_weapon_wielder"
require "chato_mud/mixins/characters/inventory/sheath_user"
require "chato_mud/mixins/characters/inventory/ranged_weapon_wielder"
require "chato_mud/mixins/characters/inventory/missile_user"
require "chato_mud/mixins/characters/inventory/quiver_user"
require "chato_mud/mixins/characters/inventory/weight_carrier"

require "chato_mud/mixins/slots/definition"
require "chato_mud/mixins/body_parts/definition"

require "chato_mud/mixins/slots/utils"

module ChatoMud

  module Controllers

    module Inventories

      class CharacterInventoryController < ChatoMud::Controllers::Inventories::InventoryController

        extend Mixins::Slots::Definition
        extend Mixins::BodyParts::Definition

        include Mixins::Slots::Utils
        include Mixins::Characters::Inventory::Finder
        include Mixins::Characters::Inventory::FinderItc
        include Mixins::Characters::Inventory::Wearer
        include Mixins::Characters::Inventory::Holder
        include Mixins::Characters::Inventory::Carrier
        include Mixins::Characters::Inventory::Armored
        include Mixins::Characters::Inventory::ShieldUser
        include Mixins::Characters::Inventory::WeaponWielder
        include Mixins::Characters::Inventory::MeleeWeaponWielder
        include Mixins::Characters::Inventory::SheathUser
        include Mixins::Characters::Inventory::RangedWeaponWielder
        include Mixins::Characters::Inventory::MissileUser
        include Mixins::Characters::Inventory::QuiverUser
        include Mixins::Characters::Inventory::WeightCarrier

        def accept_item(item_controller, remove_from_parent_inventory_controller)
          item_controller.set_slot(get_hold_slot(item_controller), false) if remove_from_parent_inventory_controller

          super(item_controller, remove_from_parent_inventory_controller)

          # During initialization WalkingController will not be present yet.
          @owner_controller.walking_controller&.check_allowed_pace
        end

        def list_inventory(gender)
          text = ""
          text << list_inventory_internal(self.class.hand_slots, gender)
          text << "\n"
          text << list_inventory_internal(self.class.worn_slots, gender)
          text
        end

        private

        def list_inventory_internal(slots, gender)
          text = ""
          slots.each do |slot|
            item_controller = find_item_controller_by_slot(slot)
            if item_controller
              text << "<#{slot_description(slot, gender)}> - #{item_controller.short_desc}\n"
            end
          end
          text
        end

      end

    end

  end

end
