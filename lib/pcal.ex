defmodule Pcal do
  defstruct month: 1, year: 2018, output: "output.pdf"

  @moduledoc """
  Documentation for Pcal.
  """

  @pcal_command "pcal"
  @pdf_converter_command "ps2pdf"
  @script "generate_pdf.sh"

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

  @doc """
  Executes the shells script #{@script}.

  ## Examples

    iex> Pcal.execute_shell(%Pcal{month: "1", year: "2019", output: "./tmp/output.pdf"})
    {:ok, "./tmp/output.pdf"}

  """
  def execute_shell(%Pcal{month: month, year: year, output: output}) do
    shell = System.find_executable("sh")

    case System.cmd(shell, [@script, month, year, output]) do
      {"", 0} ->
        {:ok, output}

      {_, error_code} ->
        {:error, "Error executing shell command #{error_code}"}
    end
  end

  @doc """
  Generates a pdf

  ## Examples

    iex> Pcal.generate_pdf(%Pcal{month: "1", year: "2019", output: "./tmp/output2.pdf"})
    {:ok, "./tmp/output2.pdf"}

  """
  def generate_pdf(%Pcal{} = pcal) do
    case Pcal.prerequisites?() do
      {:ok, _commands} ->
        execute_shell(pcal)

      _ ->
        {:error,
         "Please check prerequisites #{@pcal_command}, #{@pdf_converter_command}, and #{@script}"}
    end
  end
end
