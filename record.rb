require "pry"

class Record
  def initialize
    @wins1 = 0
    @wins2 = 0
  end

  def set_wins1
    @wins1 += 1
  end

  def set_wins2
    @wins2 += 1
  end

  def get_wins1
    @wins1
  end

  def get_wins2
    @wins2
  end
end
