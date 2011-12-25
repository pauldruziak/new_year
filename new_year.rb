# encoding: UTF-8
require "pony"
require "./lib/gift"

emails = []
File.open('emails.txt', 'r') { |f| f.each_line { |email| emails << email.strip } }

puts emails.inspect
gift = Gift.new(emails)
gift.distribute.each do |from, to|
  Pony.mail(:to => from, :subject => 'Новий рік', :body => "Ти даруєш подарунок #{to}", :via => :sendmail)
end
