require 'simple_recurring/engine'

module SimpleRecurring
  # Load adapter by name.
  #
  # Params:
  # String adapter
  #
  # Returns:
  # Implementation of SimpleRecurring::ProcessorAdapters::BaseAdapter
  def self.adapter(adapter)
    "SimpleRecurring::ProcessorAdapters::#{adapter.capitalize}".constantize
  end

  # Finds all adapters and versions.
  # Warning: This is appropriate for use in an admin panel where the processor might be selected. It is NOT appropriate
  # for use on user facing pages as it searches the file system for all available adapters and loads them.
  #
  # Returns:
  # Hash of adapters with their display name and version.
  def self.adapters
    require_adapters
    SimpleRecurring::ProcessorAdapters.constants.select { |c|
      SimpleRecurring::ProcessorAdapters.const_get(c).is_a?(Class) &&
          SimpleRecurring::ProcessorAdapters.const_get(c) != SimpleRecurring::ProcessorAdapters::BaseAdapter &&
          SimpleRecurring::ProcessorAdapters.const_get(c).ancestors.include?(SimpleRecurring::ProcessorAdapters::BaseAdapter)
    }.reduce({}) { |h, a| h[a] = { display_name: adapter(a).display_name, version: adapter(a).version }; h }
  end

  protected
  # Search autoload paths in each engine for all available process adapters.
  def self.require_adapters
    autoload_paths = Rails.application.send(:_all_autoload_paths)
    Rails::Engine.subclasses.map(&:instance).each do |engine|
      autoload_paths << engine.send(:_all_autoload_paths)
    end
    autoload_paths.flatten!
    adapter_files = []
    autoload_paths.each do |p|
      adapter_files << Dir["#{p}simple_recurring/processor_adapters/*.rb"]
    end
    adapter_files.flatten!
    adapter_files.each do |f|
      require f
    end
  end
end