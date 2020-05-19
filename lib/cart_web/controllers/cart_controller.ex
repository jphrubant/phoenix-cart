defmodule CartWeb.CartController do
  use CartWeb, :controller

  alias Cart.Cart

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, params) do
    changeset = Cart.changeset(%Cart{}, %{}) # Cart.changeset("struct", params)
    render(conn, "new.html", changeset: changeset)
  end
end
