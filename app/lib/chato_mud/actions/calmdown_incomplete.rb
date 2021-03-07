module ChatoMud

  module Actions

    class CalmdownIncomplete < BaseAction

      def exec
        return unless is_authorized?(:admin)

        return unless can_perform?([:unconscious])

        tx("Who do you want to calm down? 'calmdown *' to calm all.")
      end

    end

  end

end
