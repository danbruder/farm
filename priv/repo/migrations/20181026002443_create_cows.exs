defmodule Farm.Repo.Migrations.CreateCows do
  use Ecto.Migration

  def change do
    create table("cows") do
      add(:name, :string)
      add(:awards_won, :integer)
    end
  end
end
