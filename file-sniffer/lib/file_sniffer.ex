defmodule FileSniffer do
  def type_from_extension(extension)
  def type_from_extension("exe"), do: "application/octet-stream"
  def type_from_extension("bmp"), do: "image/bmp"
  def type_from_extension("png"), do: "image/png"
  def type_from_extension("jpg"), do: "image/jpg"
  def type_from_extension("gif"), do: "image/gif"
  def type_from_extension(_), do: nil

  def type_from_binary(file_binary)

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _::binary>>),
    do: "application/octet-stream"

  def type_from_binary(<<0x42, 0x4D, _::binary>>),
    do: "image/bmp"

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>>),
    do: "image/png"

  def type_from_binary(<<0xFF, 0xD8, 0xFF, _::binary>>),
    do: "image/jpg"

  def type_from_binary(<<0x47, 0x49, 0x46, _::binary>>),
    do: "image/gif"

  def type_from_binary(_), do: nil

  def verify(file_binary, extension) do
    from_binary = type_from_binary(file_binary)
    from_extension = type_from_extension(extension)

    if from_binary == from_extension and from_binary != nil do
      {:ok, from_binary}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
