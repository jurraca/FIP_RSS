defmodule FipRss.Repo do
  use Ecto.Repo,
    otp_app: :fip_rss,
    adapter: Ecto.Adapters.SQLite3
end