defmodule ExPayjp.Environment do

  def secret_key do
    Application.get_env(:ex_payjp, :secret_key, System.get_env("PAYJP_SECRET_KEY"))
  end

  def expiry_days do
    Application.fetch_env!(:ex_payjp, :expiry_days)
  end
  
end
