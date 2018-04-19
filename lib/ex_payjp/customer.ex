defmodule ExPayjp.Customer do
  @endpoint "https://api.pay.jp/v1/customers"

  def get(customer_id) do
    ExPayjp.get("#{@endpoint}/#{customer_id}")
  end

  def create(customer_id, token) do
    body = [id: customer_id, card: token]
    ExPayjp.post(@endpoint, body)
  end

  def delete(customer_id) do
    ExPayjp.delete("#{@endpoint}/#{customer_id}")
  end

  def get_card(customer_id, card_id) do
    ExPayjp.get("#{@endpoint}/#{customer_id}/cards/#{card_id}")
  end

  def create_card(customer_id, token) do
    body = [card: token]
    ExPayjp.post("#{@endpoint}/#{customer_id}/cards", body)
  end

  def delete_card(customer_id, card_id) do
    ExPayjp.delete("#{@endpoint}/#{customer_id}/cards/#{card_id}")
  end

end
