module ChatoMud

  module Mixins

    module Players

      module Roles

        module Definition

          def all_roles
            [
              :regular,
              :admin,
              :owner
            ]
          end

        end

      end

    end

  end

end
