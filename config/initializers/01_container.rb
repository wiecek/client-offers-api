Container = Dry::Container.new.tap do |container|
  container.register(:command_bus) { CommandBus.new }
end

Import = Dry::AutoInject(Container)
