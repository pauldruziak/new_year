require "faker"
require "./lib/gift"

describe "Gift" do
  emails = []
  10.times do
    emails << Faker::Internet.email
  end

  before(:each) do
    @gift = Gift.new(emails)
  end

  context "after create" do
    it "should not be nil" do
      @gift.should_not be_nil
    end

    it "should have #{emails.count} emails" do
      @gift.should have(emails.count).emails
    end

    emails.each do |email|
      it "should contain #{email}" do
        @gift.emails.include?(email).should be_true
      end
    end
  end

  10.times do
    context "result of distribute" do
      before(:each) do
        @result = @gift.distribute
      end

      it "should return #{emails.count} items" do
        @result.count.should be_eql(emails.count)
      end

      it "should return hash" do
        @result.is_a?(Hash).should be_true
      end

      it "shoult not contain nil as recipient" do
        @result.values.compact.count.should be_eql(emails.count)
      end

      it "should not duplicate recipients" do
        @result.values.uniq.count.should be_eql(emails.count)
      end

      it "should not give gift your self" do
        @result.each do |giver, recipient|
          giver.should_not be_eql(recipient)
          puts giver + '=>' + recipient if giver == recipient
        end
      end

      emails.each do |email|
        it "should contain #{email} as key" do
          @result.has_key?(email).should be_true
        end
      end

      emails.each do |email|
        it "should contain #{email} as value" do
          @result.has_value?(email).should be_true
        end
      end
    end
  end

end
