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
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:feeder_ex, "~> 1.1.0"},
      {:req, "~> 0.4.5"},
      {:ecto_sqlite3, "0.12.0"}
      #{:nostr, git: "https://github.com/jurraca/nostr"}
    ]
  end
end
