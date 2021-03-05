require_all "app/lib/chato_mud/mixins/characters/echoes/receiver/*.rb"

require "chato_mud/mixins/characters/physical_attrs/genders/utils"
require "chato_mud/mixins/slots/utils"
require "chato_mud/mixins/periodic/calendar/utils"
require "chato_mud/mixins/body_parts/utils"
require "chato_mud/mixins/directions/utils"

module ChatoMud
  module Mixins
    module Characters
      module Echoes
        module Receiver
          module Base
            include PhysicalAttrs::Genders::Utils
            include Slots::Utils
            include Periodic::Calendar::Utils
            include Mixins::BodyParts::Utils
            include Mixins::Directions::Utils

            include AfterMidnight
            include DipDipping
            include EmotedTell
            include FollowDirect
            include Light
            include Pour
            include SpasmDropAll
            include Unload
            include Aim
            include DipPicking
            include EmptyIntoAnother
            include FollowNewLeader
            include Load
            include Put
            include Stand
            include UnlockDoorOtherSide
            include AimSimple
            include Direction
            include EmptyOnGround
            include FollowProxy
            include LockDoorOtherSide
            include RangedAttack
            include StartCombat
            include UnlockDoor
            include Arrival
            include Dislodge
            include Evening
            include FollowStop
            include LockDoor
            include RegainConsciousness
            include StopClosedDoor
            include UnlockItem
            include DislodgeSimple
            include FallUnconscious
            include Fuel
            include LockItem
            include Remove
            include StopCombat
            include Wear
            include BeforeDawn
            include Draw
            include Fill
            include GetContainer
            include MeleeAttack
            include Rest
            include StopLoading
            include Wield
            include CeaseAiming
            include Drink
            include FinishLoading
            include GetGround
            include Midday
            include Sheathe
            include SwitchCombat
            include Wipe
            include CloseDoorOtherSide
            include DropAll
            include Fire
            include GiveFailed
            include MissilePassing
            include SimpleEmote
            include Switch
            include CloseDoor
            include Drop
            include FleeChange
            include Give
            include MorphSputter
            include SimpleSay
            include TearBook
            include CloseItem
            include Dusk
            include FleeOutcome
            include Grip
            include OpenDoorOtherSide
            include SimpleSit
            include TearWriting
            include CraftEcho
            include Eat
            include FleeStart
            include GroupFleeStart
            include OpenDoor
            include SimpleTell
            include Title
            include Dawn
            include Echo
            include FleeStop
            include HearShout
            include OpenItem
            include Sit
            include TurnAround
            include Die
            include EmotedSay
            include Flip
            include Junk
            include PourInto
            include Sound
            include Turn

            def interpolate_possessive(character_controller)
              self == character_controller ? possessive(:personal) : possessive(character_controller.physical_attr_controller.gender)
            end

            def interpolate_me_other(character_controller, for_me, for_others)
              self == character_controller ? for_me : for_others
            end

            def interpolate_me_others(first_character_controller, second_character_controller, for_first, for_second, for_others)
              return for_first  if self == first_character_controller
              return for_second if self == second_character_controller

              for_others
            end

            def you
              "you".magenta
            end

            def guess_spoken_language(speaker_controller)
              comms_controller.guess_spoken_language(speaker_controller)
            end

            def garble_speech(speech, speaker_controller)
              return speech if self == speaker_controller

              language = speaker_controller.choice_controller.language

              speaker_skill_mod = speaker_controller.stats_controller.skill_modifier(language)

              "#{comms_controller.understand_oral(speech.to_s, language, speaker_skill_mod)}"
            end

            def can_see_action?(emitter)
              return false if entity_controller.is_editing?

              self == emitter || room_controller.can_be_seen_by_character?(self)
            end

            def interpolate_refs(emote, emitter, prepend_at)
              text = ""

              at_found = false

              quoted_speech_found = false

              emote.each do |emote_part|
                case emote_part.keys[0]
                  when :emote_text
                    text << emote_part[:emote_text]
                  when :spaces
                    text << emote_part[:spaces]
                  when :at
                    text << emitter.short_desc
                    at_found = true
                  when :speech
                    text << "\"#{garble_speech(emote_part[:speech], emitter)}\""
                  when :quoted_speech
                    text << "\"#{garble_speech(emote_part[:quoted_speech], emitter).to_s.cyan}\""
                    quoted_speech_found = true
                  when :ref
                    kword = emote_part[:ref]
                    ref_type = kword[:type]
                    target   = kword[:target]
                    case ref_type
                      when "*"
                        item_controller = emitter.search_item_controller(target, :anywhere)
                        unless item_controller
                          emitter.tx("You cannot find that '#{target[:word]}'.") if self == emitter
                          return nil
                        end
                        text << item_controller.short_desc
                      when "~"
                        character_controller = emitter.search_character_controller(target)
                        unless character_controller
                          emitter.tx("You cannot find '#{target[:word]}'.") if self == emitter
                          return nil
                        end
                        text << interpolate_me_other(character_controller, you, character_controller.short_desc)
                    end
                end
              end

              text.prepend("#{emitter.short_desc} ") if prepend_at && !at_found

              text << " (#{guess_spoken_language(emitter)})" if quoted_speech_found

              text
            end
          end
        end
      end
    end
  end
end
