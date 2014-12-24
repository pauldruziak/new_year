# encoding: UTF-8
require "pony"
require "./lib/gift"

Giver = Struct.new(:email, :name, :ignore_emails) do
  def full_name
    name.blank? ? email : name
  end
end

emails = []
File.open('emails.txt', 'r') do |f|
  f.each_line do |record|
    email, name, *ignore_emails = record.split(';')
    emails << Giver.new(email.to_s.strip, name.to_s.strip, ignore_emails.to_a.map(&:strip))
  end
end

gift = Gift.new(emails)
gift.distribute.each do |from, to|
  Pony.mail(:to => from.email, :subject => 'Таємний санта', :body => "#{to.full_name} чекає на подарунок від тебе", :via => :sendmail)
end
