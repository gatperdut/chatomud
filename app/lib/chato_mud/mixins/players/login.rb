module ChatoMud

  module Mixins

    module Players

      module Login

        def show_login_prompt
          case @state
            when :providing_nickname
              "Your nickname? 'exit' to quit."
            when :providing_password
              "Your password? 'exit' to quit."
            else
              Rails.logger.error("Wrong state when showing login prompt.")
          end
        end

        def handle_nickname(nickname)
          @player = Player.find_by_nickname(nickname)
          if @player
            @state = :providing_password
            tx("Alright.\n")
          else
            tx("That nickname does not exist.\n")
          end
        end

        # TODO: Handle unconfirmed accounts.
        def handle_password(password, socket)
          if @player.valid_password?(password)
            handle_correct_authentication(socket)
          else
            handle_failed_authentication
          end
        end

        private

        def handle_correct_authentication(socket)
          case @server.entities_handler.check_duplicate(self, socket)
            when :not_duplicate
              @state = :main_menu
              create_logger
              tx("\nWelcome, #{@player.nickname}.\n")
            when :multilogin
              tx("That account is already logged in. This has been reported ...")
              Rails.logger.warn("Double authentication attempt for #{@player.nickname} from #{@socket.human_address}")
              bye(true)
            when :reconnection
              bye(false)
          end
        end

        def handle_failed_authentication
          @authentication_attempts += 1
          if @authentication_attempts < 3
            tx("Wrong password.\n")
          else
            tx("Wrong password for the third time. This has been reported ...")
            Rails.logger.warn("Three failed password attempts on #{@player.nickname} from #{@socket.human_address}")
            bye(true)
          end
        end

      end

    end

  end

end
