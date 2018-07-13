
ENV["SINATRA_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require_all 'app'

task :environment do
  require_relative './config/environment'
end

desc 'drop into the Pry console'
task :console => :environment do
  Pry.start
end
