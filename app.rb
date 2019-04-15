require "./lib/user"
require "./lib/event"
require "pry"

anis = User.new("a.bouhouche@mymail.fr",age = 25) #
clement = User.new("c.coquille@mymail.fr",age = 26) #
florian = User.new("f.chazot@mymail.fr",age = 26) #
tristan = User.new("t.morin@mymail.fr",age = 29) # "t.morin@mymail.fr",

puts User.all()

event = Event.new("2019-04-15 15:25", 30, "apérooooo")


puts event.is_past?
puts event.is_future?
puts "how many more minutes ? #{event.how_many_more_minutes}"
puts "soon ? #{event.is_soon?}"

puts "#{clement}"
puts event

puts User.find_by_email("f.chazot@mymail.fr")
