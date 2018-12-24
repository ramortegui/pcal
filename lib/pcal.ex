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

  @doc """
  Check prerequisites

  ## Exampless

      iex> Pcal.prerequisites?
      {:ok, %{command_path: "/usr/bin/pcal", converter_path: "/usr/bin/ps2pdf"}}

  """

  def prerequisites? do
    case command_exists?() do
      {:ok, command_path} ->
        case converter_exists?() do
          {:ok, converter_path} ->
            {:ok, %{command_path: command_path, converter_path: converter_path}}
          {:error, message} ->
            {:error, message}
        end
      {:error, message} ->
        {:error, message}
    end
  end
end
