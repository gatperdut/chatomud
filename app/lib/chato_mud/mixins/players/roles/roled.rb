module ChatoMud

  module Mixins

    module Players

      module Roles

        module Roled

          def role_gte?(required_role)
            case required_role
              when :owner
                [:owner].include?(role)
              when :admin
                [:owner, :admin].include?(role)
              when :regular
                [:owner, :admin, :regular].include?(role)
              else
                raise "role_gte for unknown required role"
            end
          end

        end

      end

    end

  end

end
