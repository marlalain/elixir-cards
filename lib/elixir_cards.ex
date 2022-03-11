defmodule Cards do
  @doc """
  Creates and returns a full deck of cards.
  """
  @spec create_deck :: list
  def create_deck do
    values =
      ["A", "K", "Q", "J"] ++
        Enum.map(Enum.to_list(10..2), fn e -> to_string(e) end)

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits,
        value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Deal a new hand of cards, based on hand size.
  """
  @spec deal_deck(integer) :: list
  def deal_deck(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end

  @doc """
  Shuffle a given deck of cards
  """
  @spec shuffle(any) :: list
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Returns true if the given deck has a given card. False if it doesn't.
  """
  @spec contains?(list, list) :: boolean
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Deal a deck a given deck of cards, based on hand size.
  """
  @spec deal(list, integer) :: list
  def deal(deck, hand_size) do
    Enum.take(deck, hand_size)
  end
end
