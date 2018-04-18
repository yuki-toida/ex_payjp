defmodule ExPayjp.Config do

  defp secret_key do
    Application.get_env(:payjp, :secret_key, System.get_env("PAYJP_SECRET_KEY"))
  end

end
