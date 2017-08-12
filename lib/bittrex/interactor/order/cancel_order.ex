defmodule Bittrex.Interactor.Order.CancelOrder do
  use Bittrex.Interactor

  def call(order_id) do
    HttpRequest.new(:get, "/market/cancel", [uuid: order_id])
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, _result}), do: true
  defp format_response({:error, message}), do: {:error, message}
end