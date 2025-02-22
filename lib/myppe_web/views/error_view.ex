defmodule MyppeWeb.ErrorView do
  use MyppeWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("500.json", _assigns) do
    %{errors: %{message: "Internal Server Error"}}
  end

  def render("400.json", _assigns) do
    %{success: false, message: "Request Error"}
  end

  def render("404.json", _assigns) do
    %{success: false, message: "Not Found"}
  end

  def render("error.json", %{message: message}) do
    %{success: false, message: message}
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
