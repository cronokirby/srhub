defmodule SRHub.ChangesetView do
  use SRHub.Web, :view

  def render("error.json", %{changeset: changeset}) do
    errors = for {field, detail} <- changeset.errors, into: %{} do
      {field, render_detail(detail)}
    end
    %{errors: errors}
  end

  def render_detail({message, values}) do
    Enum.reduce(values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end)
  end
  def render_detail(message) do
    message
  end
end
