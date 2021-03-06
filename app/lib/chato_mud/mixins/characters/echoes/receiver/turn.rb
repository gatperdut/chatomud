module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          module Turn

            def recv_turn(params)
              emitter = params[:emitter]
              target  = params[:target]

              return unless can_see_action?(emitter)

              text = interpolate_me_other(emitter, "You turn back to page #{target.book_controller.current_page} of ", "#{emitter.short_desc} turns the page of ")

              text << "#{target.short_desc}."

              tx(text)
            end

          end

        end

      end

    end

  end

end
