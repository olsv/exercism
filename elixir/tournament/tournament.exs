defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """

  @header ~w(Team MP W D L P)
  @default_results %{games: 0, wins: 0, draws: 0, losses: 0, points: 0}

  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    input
    |> build_tournament_table
    |> output_results
  end

  defp build_tournament_table(games) do
    games
    |> Enum.map(&String.split(&1, ";", parts: 3))
    |> Enum.reduce(%{}, &update_results/2)
  end

  defp update_results([a, b, "win"], table),
    do: table |> Map.put(a, win(a, table)) |> Map.put(b, loss(b, table))
  defp update_results([a, b, "draw"], table),
    do: table |> Map.put(a, draw(a, table)) |> Map.put(b, draw(b, table))
  defp update_results([a, b, "loss"], table),
    do: update_results([b, a, "win"], table)
  defp update_results(_, table),
    do: table

  defp win(team, table) do
    current = results(team, table)
    %{wins: wins, games: games, points: points} = current
    %{current | wins: wins + 1, games: games + 1, points: points + 3}
  end

  defp loss(team, table) do
    current = results(team, table)
    %{losses: losses, games: games} = current
    %{current | losses: losses + 1, games: games + 1}
  end

  defp draw(team, table) do
    current = results(team, table)
    %{draws: draws, games: games, points: points} = current
    %{current | draws: draws + 1, games: games + 1, points: points + 1}
  end

  defp results(team, table), do: Map.get(table, team, @default_results)

  defp output_results(table) do
    table
    |> Enum.sort_by(&mapper/1, &sorter/2)
    |> Enum.map(&to_values/1)
    |> List.insert_at(0, @header)
    |> Enum.map_join("\n", &format_line/1)
  end

  defp to_values({team, %{games: g, wins: w, draws: d, losses: l, points: p}}),
    do: [team | Enum.map([g, w, d, l, p], &to_string/1)]

  defp format_line([h | t]) do
    h = String.pad_trailing(h, 30)
    t = Enum.map(t, &String.pad_leading(&1, 2))

    Enum.join([h | t], " | ")
  end

  defp mapper({name, %{points: points}}), do: {points, name}

  defp sorter({apoints, _}, {bpoints, _}) when apoints > bpoints, do: true
  defp sorter({apoints, _}, {bpoints, _}) when apoints < bpoints, do: false
  defp sorter({_, aname}, {_, bname}), do: sorter(aname, bname)
  defp sorter(<<a, _::binary>>, <<b, _::binary>>) when a > b, do: false
  defp sorter(<<a, _::binary>>, <<b, _::binary>>) when a < b, do: true
  defp sorter(<<_, a::binary>>, <<_, b::binary>>), do: sorter(a, b)
  defp sorter(<<_::binary>>, ""), do: false
  defp sorter("", <<_::binary>>), do: true
  defp sorter("", ""), do: true
end
