# Allows Rails to load the style tasks
module BlueSteel
  # Inherits from Railtie
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/style.rake'
    end
  end
end
