module ChatoMud

  module Actions

    class Awho < BaseAction

      def exec
        return unless is_authorized?(:admin)

        tx(@server.characters_handler.awho)
      end

    end

  end

end
