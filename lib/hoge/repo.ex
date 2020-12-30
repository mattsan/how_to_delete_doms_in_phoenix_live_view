defmodule Hoge.Repo do
  use Ecto.Repo,
    otp_app: :hoge,
    adapter: Ecto.Adapters.Postgres
end
