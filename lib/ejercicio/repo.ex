defmodule Ejercicio.Repo do
  use Ecto.Repo,
    otp_app: :ejercicio,
    adapter: Ecto.Adapters.Postgres
end
