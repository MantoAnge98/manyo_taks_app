require_relative 'boot'

require 'kaminari'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ManyoTaskApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    #Add time zone 
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local   
    
    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
      g.test_framework :rspec,
        model_specs: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
    end

     #Dynamique Error 404 and 500
     config.exceptions_app = self.routes
     config.assets.initialize_on_precompile = false
    
  end
end
