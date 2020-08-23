require_relative "../lib/breweries/version"
require_relative "../lib/breweries/cli"
require_relative "../lib/breweries/location"
require_relative "../lib/breweries/api"
require 'open-uri'
require 'json'
require 'net/http'
require 'pry'

module Breweries
  class Error < StandardError; end
  # Your code goes here...
end
