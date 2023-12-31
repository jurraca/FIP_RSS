defmodule FipRss.MixProject do
  use Mix.Project

  def project do
    [
      app: :fip_rss,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {FipRss.Application, []},
      extra_applications: [:logger, :runtime_tools, :ecto, :exqlite]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:feeder_ex, "~> 1.1.0"},
      {:req, "~> 0.4.5"},
      {:ecto_sqlite3, "~> 0.13.0"},
      {:timex, "~> 3.7.11"}
      #{:nostr, git: "https://github.com/jurraca/nostr"}
    ]
  end
end
