defmodule Cart.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :item, :string
    field :quantity, :integer

    timestamps()
  end

  def changeset(cart, attrs) do #maybe add an empty model as defalut with \\ %{}
    cart
     |> cast(attrs, [:item, :quantity])
     |> validate_required([:item, :quantity])
  end

end
