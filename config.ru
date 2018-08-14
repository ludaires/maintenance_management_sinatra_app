require './config/environment'

if ActiveRecord::Migrator.needs_migration?
    raise "Migrations are peding. Run 'rake db:migration' to resolve the issue."
end


# use OmniAuth::Builder do
#     provider :auth0, ENV['AUTH0_CLIENT_ID'], ENV['AUTH0_CLIENT_SECRET'], ENV['AUTH0_DOMAIN']
# end


use Rack::MethodOverride

run ApplicationController
