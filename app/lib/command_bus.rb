require 'arkency/command_bus'

class CommandBus < Arkency::CommandBus
  def initialize
    super
    register_commands(self)
  end

  def register_commands(bus)
    commands = [
      Offers::Commands::AcceptOffer,
      Offers::Commands::CreateOffer
    ]

    commands.each do |command|
      bus.register(command, handler_lambda)
    end
  end

  def handler_lambda
    lambda do |command|
      command.class::Handler.new.call(command)
    end
  end
end
