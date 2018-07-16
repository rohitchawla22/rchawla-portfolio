defmodule Portfolio.ContactFormController do
  use PortfolioWeb, :controller
  alias Platform.Emails

  def new(conn, %{"email" => email,
                  "message" => message,
                  "name" => name,
                  "phone" => phone} = _params) do

    Emails.build_contact_form(name, email, message, phone)
    |> Emails.deliver_later()

    text conn, "OK"
  end
end
