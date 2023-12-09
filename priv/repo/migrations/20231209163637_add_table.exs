defmodule FipRss.Repo.Migrations.AddTable do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :title, :string
      add :summary, :string
      add :url, :string
      add :date, :integer
    
      timestamps()
  end

  create unique_index(:items, [:url])
 end
end
