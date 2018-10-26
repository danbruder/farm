defmodule FarmWeb.Router do
  use Trot.Router
  alias Farm.{Cow, Repo}
  alias FarmWeb.Error
  alias FarmWeb.Helpers

  # Setup a static route to priv/static/assets
  static("/css", "assets")

  get "/cows" do
    Cow
    |> Repo.all()
  end

  post "/cows/:id/update" do
    conn
    |> Cow.update(id)
    |> Helpers.handle_change_error()
  end

  post "/cows/create" do
    conn
    |> Cow.create()
    |> Helpers.handle_change_error()
  end

  import_routes(Trot.NotFound)
end
