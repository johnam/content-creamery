Dir[Rails.root.join('lib', 'core_extensions', '**', '*.rb').to_s].each{ |f| require f }

Array.include CoreExtensions::Array::SplitInto