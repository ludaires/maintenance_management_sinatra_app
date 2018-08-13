require './config/environment'

if ActiveRecord::Migrator.needs_migration?
    raise "Migrations are peding. Run 'rake db:migration' to resolve the issue."
end
    use Rack::MethodOverride

    run ApplicationController