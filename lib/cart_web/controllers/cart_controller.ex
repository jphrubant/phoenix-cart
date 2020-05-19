defmodule CartWeb.CartController do
  use CartWeb, :controller

  alias Cart.Repo
  alias Cart.Cart

  def index(conn, _params) do
    cart = Repo.all(Cart)
    render(conn, "index.html", cart: cart)
  end

  def new(conn, params) do
    changeset = Cart.changeset(%Cart{}, %{}) # === Cart.changeset("struct", params)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cart" => cart}) do
    changeset = Cart.changeset(%Cart{}, cart)

    case Repo.insert(changeset) do
      {:ok, cart} ->
        conn
          |> put_flash(:info, "Item added successfully")
          |> redirect(to: Routes.cart_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
