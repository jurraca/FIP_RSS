defmodule FipRss do
  @moduledoc """
  Documentation for `FipRss`.
  """
  alias Exqlite.{Sqlite3, Basic}
  
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
      {:ok, feed} -> {:ok, feed}
      {:error, reason} -> {:error, reason}
    end
  end

  # Step 4: Process the entries
  def process_entries(feed) when is_map(feed) do
    Enum.each(feed.entries, fn entry ->
      case insert_item(entry) do
        :ok -> post_to_nostr(entry)
        err -> err
      end
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

  def insert_item(%{title: title, summary: summary, link: url, updated: date}) do
    unix_ts = parse_date(date)
    {:ok, conn} = Basic.open("db.sqlite3")
    insert_statement = "INSERT OR IGNORE INTO into items (title, summary, date) values (?1, ?2, ?3)"
    with Repo.insert(insert_statement) do # fix this to be a struct, create schema etc
        :ok
       else
        {:error, reason} ->
        IO.warn("Error inserting into SQLite db: #{reason}")
    end
  end

  def post_to_nostr(%{title: title, summary: summary, link: url}) do
      :ok
  end

  defp parse_date(date_str) do
    case Timex.parse(date_str, "{RFC1123}") do
      {:ok, datetime} -> DateTime.to_unix(datetime)
      {:error, _} = err -> err
    end
  end
end
