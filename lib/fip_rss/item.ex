defmodule FipRss.Item do
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "items" do
    field :title, :string
    field :summary, :string
    field :url, :string
    field :date, :integer

    timestamps()
  end
  
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :summary, :url, :date])
    |> validate_required([:title, :summary, :url, :date])
    |> unique_constraint(:url)
  end
end
