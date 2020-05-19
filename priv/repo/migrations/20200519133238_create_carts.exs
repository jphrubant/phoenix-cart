defmodule Cart.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :item, :string
      add :quantity, :integer
    end
  end
end
