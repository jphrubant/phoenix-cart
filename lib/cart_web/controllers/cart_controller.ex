defmodule CartWeb.CartController do
  use CartWeb, :controller

  alias Cart.Repo
  alias Cart.Cart

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, params) do
    changeset = Cart.changeset(%Cart{}, %{}) # === Cart.changeset("struct", params)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cart" => params}) do
    changeset = Cart.changeset(%Cart{}, params)

    case Repo.insert(changeset) do
      {:ok, params} -> IO.inspect(params)
      {:error, changeset} -> IO.inspect(changeset)
    end
  end

end
