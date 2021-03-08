class ApplicationPolicy

  attr_reader :player, :record

  def initialize(player, record)
    @player = player
    @record = record
  end

end
