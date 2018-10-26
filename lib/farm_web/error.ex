defmodule FarmWeb.Error do
  def from_changeset(%Ecto.Changeset{valid?: true}), do: []

  def from_changeset(%Ecto.Changeset{valid?: false, errors: errors} = changeset) do
    errors =
      Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
        Enum.reduce(opts, msg, fn {key, value}, acc ->
          String.replace(acc, "%{#{key}}", to_string(value))
        end)
      end)

    %{
      errors: errors
    }
  end
end
