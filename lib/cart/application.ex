defmodule Cart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Cart.Repo,
      # Start the Telemetry supervisor
      CartWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Cart.PubSub},
      # Start the Endpoint (http/https)
      CartWeb.Endpoint
      # Start a worker by calling: Cart.Worker.start_link(arg)
      # {Cart.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cart.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CartWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
