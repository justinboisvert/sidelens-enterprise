#!/usr/bin/env ruby
require 'unirest'

req = Unirest.post("http://localhost:3000/enterprise/create", parameters: {:username => "jb", :password => "cookie"})

puts req.body

req = Unirest.post("http://localhost:3000/enterprise/login", parameters: {:username => "jb", :password => "cookie"})

puts req.body

session = req.body["session"]

req = Unirest.get("http://localhost:3000/enterprise/self", headers: {:Auth => session})

puts req.body

req = Unirest.post("http://localhost:3000/enterprise/logout", headers: {:Auth => session})

puts req.body
