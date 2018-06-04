defmodule ProjectWeb.LayoutView do
  use ProjectWeb, :view

  def socket_url, do: Application.get_env(:project, ProjectWeb.Endpoint)[:socket_url] || "ws://localhost:4000/socket/websocket"
    
end
