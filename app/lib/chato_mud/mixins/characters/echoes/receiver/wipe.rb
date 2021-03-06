module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          module Wipe

            def recv_wipe(params)
              emitter = params[:emitter]
              target  = params[:target]

              return unless can_see_action?(emitter)

              text = interpolate_me_other(emitter, "You wipe ", "#{emitter.short_desc} wipes ")

              text << "#{target.short_desc}."

              tx(text)
            end

          end

        end

      end

    end

  end

end
