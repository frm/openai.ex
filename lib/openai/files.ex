defmodule OpenAI.Files do
  @moduledoc false
  alias OpenAI.Client
  alias OpenAI.Config

  @files_base_url "/v1/files"

  def url(), do: @files_base_url
  def url(file_id), do: "#{@files_base_url}/#{file_id}"
  def url(file_id, path), do: "#{url(file_id)}/#{path}"

  def fetch(config \\ %Config{}) do
    url()
    |> Client.api_get(config)
  end

  def fetch_by_id(file_id, config \\ %Config{}) do
    url(file_id)
    |> Client.api_get(config)
  end

  def fetch_content(file_id, config \\ %Config{}) do
    url(file_id, "content")
    |> Client.api_get(config)
  end

  def delete(file_id, config \\ %Config{}) do
    url(file_id)
    |> Client.api_delete(config)
  end

  def upload(file_path, params, config \\ %Config{}) do
    url()
    |> Client.multipart_api_post(file_path, "file", params, config)
  end
end
