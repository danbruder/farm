defmodule FarmWeb.Helpers do
  alias FarmWeb.Error

  def handle_change_error({:ok, result}), do: result
  def handle_change_error({:error, :not_found}), do: {404, "Not Found"}

  def handle_change_error({:error, %Ecto.Changeset{} = changeset}) do
    {422, changeset |> Error.from_changeset()}
  end
end
