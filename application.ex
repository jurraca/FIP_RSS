defmodule FipRss.Application do
  use Application

  def start(_type, _args) do
    children = [
      # Defines a worker that starts a new Ecto repository
      {FipRss.Repo, []}
    ]

    # Configures the application
    opts = [strategy: :one_for_one, name: FipRss.Supervisor]

    # Starts the application and the supervisors/children defined above
    Supervisor.start_link(children, opts)
  end
end