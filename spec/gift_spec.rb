require 'coveralls'
Coveralls.wear!

require "faker"
require "./lib/gift"

describe "Gift" do
  Giver = Struct.new(:email, :name, :ignore_emails)
  emails = []
  10.times do
    ignore = emails.at(rand(emails.count))
    ignore_email = ignore.email if ignore
    emails << Giver.new(Faker::Internet.email, Faker::Name.name, [ignore_email])
  end

  before(:each) do
    @gift = Gift.new(emails)
  end

  context "after create" do
    it "should not be nil" do
      expect(@gift).to_not be_nil
    end

    it "should have #{emails.count} emails" do
      expect(@gift.emails.count).to eq(emails.count)
    end

    emails.each do |email|
      it "should contain #{email}" do
        expect(@gift.emails).to include(email)
      end
    end
  end

  10.times do
    context "result of distribute" do
      before(:each) do
        @result = @gift.distribute
      end

      it "should return #{emails.count} items" do
        expect(@result.count).to eq(emails.count)
      end

      it "should return hash" do
        expect(@result).to be_kind_of(Hash)
      end

      it "shoult not contain nil as recipient" do
        expect(@result.values.compact.count).to eq(emails.count)
      end

      it "should not duplicate recipients" do
        expect(@result.values.uniq.count).to eql(emails.count)
      end

      it "should not give gift your self" do
        @result.each do |giver, recipient|
          expect(giver).to_not eq(recipient)
          puts giver + '=>' + recipient if giver == recipient
        end
      end

      emails.each do |email|
        it "should contain #{email} as key" do
          expect(@result.has_key?(email)).to be_truthy
        end
      end

      emails.each do |email|
        it "should contain #{email} as value" do
          expect(@result.has_value?(email)).to be_truthy
        end
      end
    end
  end

end
