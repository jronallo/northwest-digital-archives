# Settings specified here will take precedence over those in config/environment.rb

# The test environment is used exclusively to run your application's
# test suite.  You never need to work with it otherwise.  Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs.  Don't rely on the data there!
config.cache_classes = true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell ActionMailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

SSL_ENABLED=false

# got this idea from Rails' Initializer#load_environment()
# it's reading the file and evaluating it in the context of this code
# This way, we keep things dry between Blacklight's stand-alone testing and 
# running as a plugin.
init_path = File.join(File.dirname(__FILE__), '../../init.rb')
eval(IO.read(init_path), binding, init_path)