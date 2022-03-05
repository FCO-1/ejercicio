defmodule EjercicioWeb.Router do
  use EjercicioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {EjercicioWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EjercicioWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/cliente", ClienteLive.Index, :index
    live "/cliente/new", ClienteLive.Index, :new
    live "/cliente/:id/edit", ClienteLive.Index, :edit
    live "/cliente/:id", ClienteLive.Show, :show
    live "/cliente/:id/show/edit", ClienteLive.Show, :edit


    live "/pedidos_clientes", PedidosClienteLive.Index, :index
    live "/pedidos_clientes/new", PedidosClienteLive.Index, :new
    live "/pedidos_clientes/:id/edit", PedidosClienteLive.Index, :edit
    live "/pedidos_clientes/:id", PedidosClienteLive.Show, :show
    live "/pedidos_clientes/:id/show/edit", PedidosClienteLive.Show, :edit

    live "/categorias", CategoriaLive.Index, :index
    live "/categorias/new", CategoriaLive.Index, :new
    live "/categorias/:id/edit", CategoriaLive.Index, :edit

    live "/categorias/:id", CategoriaLive.Show, :show
    live "/categorias/:id/show/edit", CategoriaLive.Show, :edit

    live "/pedidos", PedidoLive.Index, :index
    live "/pedidos/new", PedidoLive.Index, :new
    live "/pedidos/:id/edit", PedidoLive.Index, :edit

    live "/pedidos/:id", PedidoLive.Show, :show
    live "/pedidos/:id/show/edit", PedidoLive.Show, :edit

    live "/productos", ProductoLive.Index, :index
    live "/productos/new", ProductoLive.Index, :new
    live "/productos/:id/edit", ProductoLive.Index, :edit

    live "/productos/:id", ProductoLive.Show, :show
    live "/productos/:id/show/edit", ProductoLive.Show, :edit

  end

  # Other scopes may use custom stacks.
  # scope "/api", EjercicioWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: EjercicioWeb.Telemetry
    end
  end
end
