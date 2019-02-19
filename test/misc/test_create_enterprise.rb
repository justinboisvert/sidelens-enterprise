#!/usr/bin/env ruby
require 'unirest'

req = Unirest.post("http://localhost:3000/enterprise/create", parameters: {:username => "aaron", :password => "cookie", :company => "joblo"})

puts req.body

req = Unirest.post("http://localhost:3000/enterprise/login", parameters: {:username => "jason1", :password => "cookie"})

puts req.body

session = req.body["session"]

req = Unirest.get("http://localhost:3000/enterprise/self", headers: {:Auth => session})

puts req.body

interface = {:name => "Sexy API", :description => "Serves only the best for people.", :host => "103.0.33.2.1", :port => 80}  

req = Unirest.post("http://localhost:3000/enterprise/interfaces/create", headers: {:Auth => session}, parameters: interface)

puts req.body

req = Unirest.post("http://localhost:3000/enterprise/logout", headers: {:Auth => session})

puts req.body
