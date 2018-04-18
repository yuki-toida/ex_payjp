defmodule ExPayjp.Charge do
  alias ExPayjp
  alias ExPayjp.Environment
  @endpoint "https://api.pay.jp/v1/charges"

  def get(charge_id) do
    "#{@endpoint}/#{charge_id}"
    |> ExPayjp.get()
  end

  @doc """
  顧客情報による支払作成
    - capture: 支払処理を確定させるかどうか
      true ->  支払確定処理
      false -> 与信枠確保 → 支払処理の2段階
  """
  def charge_customer(uid, amount, capture, currency \\ "jpy") do
    body = [customer: uid, amount: amount, currency: currency, capture: capture]
    body = case capture do
      true -> body
      false -> body ++ [expiry_days: Environment.expiry_days()]
    end
    ExPayjp.post(@endpoint, body)
  end

  @doc """
  カードトークンによる支払作成
    - capture: 支払処理を確定させるかどうか
      true ->  支払確定処理
      false -> 与信枠確保 → 支払処理の2段階
  """
  def charge_token(card_token, amount, capture, currency \\ "jpy") do
    body = [card: card_token, amount: amount, currency: currency, capture: capture]
    body = case capture do
      true -> body
      false -> body ++ [expiry_days: Environment.expiry_days()]
    end
    ExPayjp.post(@endpoint, body)
  end

  @doc """
  認証状態処理待の支払情報を支払確定させる
  captured: false が対象
  """
  def capture(charge_id) do
    "#{@endpoint}/#{charge_id}/capture"
    |> ExPayjp.post([])
  end

  @doc """
  全額返金/与信解放する
  refunded: false が対象
  captured: true -> 全額返金
  captured: false -> 与信解放
  """
  def refund(charge_id) do
    "#{@endpoint}/#{charge_id}/refund"
    |> ExPayjp.post([])
  end

end
