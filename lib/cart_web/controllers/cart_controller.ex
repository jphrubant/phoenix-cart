defmodule CartWeb.CartController do
  use CartWeb, :controller

  alias Cart.Repo
  alias Cart.Cart

  def index(conn, _params) do
    cart = Repo.all(Cart)
    render(conn, "index.html", cart: cart)
  end

  def new(conn, _params) do
    changeset = Cart.changeset(%Cart{}, %{}) # === Cart.changeset(struct, params)
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

  def edit(conn, %{"id" => cart_id}) do
    cart = Repo.get(Cart, cart_id)
    changeset = Cart.changeset(cart, %{})

    render(conn, "edit.html", changeset: changeset, cart: cart)
  end

  def update(conn, %{"cart" => cart, "id" => id}) do
    old_cart = Repo.get(Cart, id)
    changeset = Cart.changeset(old_cart, cart)

    case Repo.update(changeset) do
      {:ok, _cart} ->
        conn
          |> put_flash(:info, "Cart Updated")
          |> redirect(to: Routes.cart_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, cart: old_cart)
    end
  end

end
