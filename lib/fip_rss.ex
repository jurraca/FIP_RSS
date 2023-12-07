defmodule FipRss do
  @moduledoc """
  Documentation for `FipRss`.
  """
  
  @feed_url "https://www.radiofrance.fr/fip/rss"

  def fetch_feed_data(url) do
    case Req.get(url) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        {:ok, body}
      {:ok, %Req.Response{status: status_code}} ->
        {:error, "Failed to fetch RSS feed. Status code: #{status_code}"}
      {:error, msg} ->
        {:error, "Failed to fetch RSS feed. Reason: #{msg}"}
    end
  end

  # Step 3: Parse the feed
  def parse_feed(feed_data) do
    case FeederEx.parse(feed_data) do
      {:ok, feed, _} -> {:ok, feed}
      {:error, reason} -> {:error, reason}
    end
  end

  # Step 4: Process the entries
  def process_entries(feed) when is_map(feed) do
    Enum.each(feed.entries, fn entry ->
      # Here, we want to store entries in a local db
      # And, if the entry is new, post it to Nostr
      # Nostr.
      IO.puts(entry.title)
      IO.puts(entry.summary)
      IO.puts("URL: " <> entry.link)
    end)
  end

  def track_feed_updates do
    with {:ok, feed_data} <- fetch_feed_data( @feed_url),
         {:ok, feed} <- parse_feed(feed_data) do
      process_entries(feed)
    else
      {:error, reason} ->
        IO.warn("Error handling the RSS feed: #{reason}")
    end
  end
end
