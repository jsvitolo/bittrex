defmodule Bittrex.Interactor.Account.GetDepositHistory do
  @moduledoc false

  use Bittrex.Interactor
  alias Bittrex.Payment

  def call(currency) do
    :get
    |> HttpRequest.new("/account/getdeposithistory", currency: currency)
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    response = Enum.map(result, &Payment.new/1)
    {:ok, response}
  end

  defp format_response({:error, message}), do: {:error, message}
end
