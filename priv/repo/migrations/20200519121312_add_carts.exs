defmodule Cart.Repo.Migrations.AddCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :cart, :map
    end
  end
end
