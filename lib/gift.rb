class Gift

  attr_reader :givers, :recipients, :emails

  def initialize(emails)
    @emails = emails
  end

  def distribute
    @recipients, @givers = @emails.clone, @emails.clone
    result = {}
    until @givers.empty? do
      giver = next_giver
      result[giver] = who_gets_from giver
    end
    result
  rescue => e
    distribute
  end

private
  def next_giver
    @givers.delete_at rand(@givers.count)
  end

  def who_gets_from(giver)
    recipients = (@recipients - [giver]).delete_if { |recipient| giver.ignore_emails.include?(recipient.email) }
    if recipients.count == 0
      fail 'start again'
    else
      begin
        recipient = recipients.at rand(recipients.count - 1)
      end while giver.ignore_emails.include?(recipient.email)
      @recipients.delete(recipient)
    end
  end
end
