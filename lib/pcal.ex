defmodule Pcal do
  @moduledoc """
  Documentation for Pcal.
  """

  @pcal_command "pcal"
  @pdf_converter_command "ps2pdf"

  @doc """
  Check if pcal command exists.

  ## Examples

      iex> Pcal.command_exists?
      {:ok, "/usr/bin/pcal"}

  """
  def command_exists? do
    case System.find_executable(@pcal_command) do
      path when is_binary(path) -> {:ok, path}
      _ -> {:error, "can not find executable #{@pcal_command}."}
    end
  end

  @doc """
  Check if pcal command exists.

  ## Examples

      iex> Pcal.converter_exists?
      {:ok, "/usr/bin/ps2pdf"}

  """
  def converter_exists? do
    case System.find_executable(@pdf_converter_command) do
      path when is_binary(path) -> {:ok, path}
      _ -> {:error, "can not find executable #{@pdf_converter_command}."}
    end
  end
end
