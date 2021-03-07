module ChatoMud

  module Actions

    class Echo < BaseAction

      def exec
        return unless is_authorized?(:admin)

        return unless is_authorized?(:admin)

        return unless can_perform?([:unconscious])

        room_controller.emit_action_echo("echo", { speech: @params[:speech] })
      end

    end

  end

end
