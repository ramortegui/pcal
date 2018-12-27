defmodule Pcal do
  @moduledoc """
  Documentation for Pcal.
  """

  @pcal_command "pcal"
  @pdf_converter_command "ps2pdf"

  @doc """
  Check if pcal command exists.

  ## Examples

      iex> {:ok, path} = Pcal.command_exists?
      iex> String.ends_with?(path, "/pcal")
      true

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

      iex> {:ok, path} = Pcal.converter_exists?
      iex> String.ends_with?(path, "/ps2pdf")
      true

  """
  def converter_exists? do
    case System.find_executable(@pdf_converter_command) do
      path when is_binary(path) -> {:ok, path}
      _ -> {:error, "can not find executable #{@pdf_converter_command}."}
    end
  end

  @doc """
  Check prerequisites

  ## Examples

      iex> Pcal.prerequisites?
      iex> {:ok, %{command_path: command_path, converter_path: converter_path}} = {:ok, %{command_path: "/usr/bin/pcal", converter_path: "/usr/bin/ps2pdf"}}
      iex> String.ends_with?(command_path, "/pcal")
      true
      iex> String.ends_with?(converter_path, "/ps2pdf")
      true

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
