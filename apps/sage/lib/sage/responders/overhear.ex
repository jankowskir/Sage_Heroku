defmodule Sage.Responders.Overhear do
  @moduledoc """
  Listends for specific patterns in order to respond with something whimsical.

  ### Examples

      User> (╯°□°）╯︵ ┻━┻
      sage> ┬──┬◡ﾉ(° -°ﾉ)

      User> Seriously guys, this is important
      sage> http://i.imgur.com/0lyao5E.gif

  """

  use Sage.Responder

  # High five
  hear ~r/^\^5 (.+)$/, msg do
    recipient = msg.matches[1]
    emote msg, "high fives #{recipient}"
  end

  hear ~r/^joined #testing/, msg do
    emote msg, "debug"
  end

# Motivational video. JankowskiR commented out the if statements to reduce duplication that's unnecessary.
  hear ~r/^just do it,?(?: (\w+))?$/, msg do
#    if msg.matches[1] do
      send msg, "#{msg.matches[1]}: https://www.youtube.com/watch?v=hAEQvlaZgKY"
#    else
#      send msg, "https://www.youtube.com/watch?v=hAEQvlaZgKY"
#    end
  end

  # Relax
  hear ~r/just relax/, msg do
    send msg, "https://thumbs.gfycat.com/FabulousShadowyJumpingbean-size_restricted.gif"
    send msg, "Relax......."
  end

  # Keeping order
  hear ~r/┻━┻/, msg do
    send msg, "┬──┬◡ﾉ(° -°ﾉ)"
  end

  # For serious
  hear ~r/srsly guise|seriously,? guys/, msg do
    send msg, Enum.random([
      "http://i.imgur.com/0lyao5E.gif",
      "http://i.imgur.com/0lyao5E.gif",
      "http://i.imgur.com/0lyao5E.gif",
      "http://i.imgur.com/xU7AhQh.gif",
      "http://i.imgur.com/dpFlIMx.gif",
      "http://i.imgur.com/mE2oDmm.gif",
      "http://i.imgur.com/ersspRE.gif",
    ])
  end
    defp get_username(user) when is_binary(user), do: user
    defp get_username(%{name: name}), do: name
end
