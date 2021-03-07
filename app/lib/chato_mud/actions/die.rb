module ChatoMud

  module Actions

    class Die < BaseAction

      def exec
        return unless is_authorized?(:admin)

        @character_controller.die
      end

    end

  end

end
