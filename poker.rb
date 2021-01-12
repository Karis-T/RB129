class Card
  include Enumerable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    convert_rank <=> other.convert_rank
  end

  def to_s
    "The #{@rank} of #{@suit}"
  end

  def ==(other)
    rank == other.rank
  end
  
  protected

  def convert_rank
    case @rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    else @rank
    end
  end
end