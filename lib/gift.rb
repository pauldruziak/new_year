class Gift

  attr_reader :givers, :recipients, :emails

  def initialize(emails)
    @emails = emails
  end

  def distribute
    @recipients = @emails.clone
    @givers = @emails.clone
    result = {}
    while @givers.count != 0 do
      giver = next_giver
      result[giver] = who_gets_from giver
    end
    result
  end

  def next_giver
    @givers.delete_at rand(@givers.count)
  end

private

  def who_gets_from(giver) 
    @recipients.delete giver
    recipient = @recipients.delete_at rand(@recipients.count)
    @recipients << giver
    recipient
  end
end
