import Config

config :fip_rss, ecto_repos: [FipRss.Repo]

# Configure your database for SQLite3
config :fip_rss, FipRss.Repo,
  database: "db.sqlite3",
  pool_size: 2