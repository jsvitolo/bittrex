defmodule Bittrex.Interactor.Market.BuyLimit do
  @moduledoc false

  use Bittrex.Interactor
  alias Bittrex.Order

  def call(market_name, quantity, rate) do
    params = [
      market: market_name,
      quantity: quantity,
      rate: rate
    ]

    :get
    |> HttpRequest.new("/market/buylimit", params)
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    response = Order.new(result)
    {:ok, response}
  end

  defp format_response({:error, message}), do: {:error, message}
end
