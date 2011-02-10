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
  end

private
  def next_giver
    @givers.delete_at rand(@givers.count)
  end

  def who_gets_from(giver)
    if @givers.count == 1 and @recipients.include?(@givers.last)
      @recipients.delete @givers.last
    else
      @recipients.delete((@recipients - [giver]).at rand(@recipients.count - 1))
    end
  end
end
