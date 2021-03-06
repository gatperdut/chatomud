module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          module CloseDoorOtherSide

            def recv_close_door_other_side(params)
              door_controller = params[:door]

              text = "#{door_controller.long_desc} is closed from the other side."

              tx(text)
            end

          end

        end

      end

    end

  end

end
