defmodule ExPayjp do
  alias ExPayjp.Environment

  def get(url) do
    HTTPoison.get(url, headers())
    |> decode()
  end

  def post(url, body) do
    headers = headers() ++ [{"Content-Type", "application/x-www-form-urlencoded"}]
    HTTPoison.post(url, {:form, body}, headers)
    |> decode()
  end

  def delete(url) do
    HTTPoison.delete(url, headers())
    |> decode()
  end

  defp headers do
    encode64_key = Base.encode64(Environment.secret_key() <> ":")
    [{"Authorization", "Basic " <> encode64_key}]
  end

  defp decode(response) do
    case response do
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
      {:ok, %HTTPoison.Response{body: body}} ->
        case Poison.decode!(body) do
          %{"error" => error} -> {:error, error["message"]}
          decoded_body -> {:ok, decoded_body}
        end
    end
  end

end
