defmodule FeenixIntro.Repo do
  use Ecto.Repo,
    otp_app: :feenix_intro,
    adapter: Ecto.Adapters.Postgres
end
