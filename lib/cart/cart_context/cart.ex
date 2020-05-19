defmodule Cart.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :cart, :map

    timestamps()
  end

  def changeset(cart, attrs) do
    cart
     |> cast(attrs, [:map])
     |> validate_required([:map])
  end

end
