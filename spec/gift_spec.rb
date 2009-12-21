require "#{File.dirname(__FILE__)}/spec_helper"
 
describe "Gift" do
  emails = ["A", "B", "C", "D", "E", "F"]

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

  context "result of distribute" do
    before(:each) do 
      @result = @gift.distribute
    end

    it "should return #{emails.count} items" do
      emails = ["A", "B", "C", "D", "E", "F"]
      @result.count.should be_eql(emails.count)
    end

    it "should return hash" do
      @result.is_a?(Hash).should be_true
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
