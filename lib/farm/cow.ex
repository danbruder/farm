defmodule Farm.Cow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Farm.Repo
  alias Farm.Cow

  schema "cows" do
    field(:name, :string)
    field(:awards_won, :integer)
  end

  def changeset(cow \\ %__MODULE__{}, attrs \\ %{}) do
    cow
    |> cast(attrs, [:name, :awards_won])
    |> validate_required([:name])
    |> validate_number(:awards_won, less_than: 3)
  end

  def create(%{params: params}) do
    %__MODULE__{}
    |> changeset(params)
    |> Repo.insert()
  end

  def create(_), do: changeset()

  def update(%{params: params}, id) do
    case Repo.get(Cow, id) do
      nil ->
        {:error, :not_found}

      cow ->
        cow
        |> changeset(params)
        |> Repo.update()
    end
  end
end
