module ChatoMud

  module Actions

    class Visible < BaseAction

      def exec
        return unless is_authorized?(:admin)

        if @character_controller.visibility_controller.is_visible?
          tx("You are already visible ...")
          return
        end

        @character_controller.visibility_controller.turn(true)

        tx("You make yourself visible.")
      end

    end

  end

end
