defmodule DNA do
  def encode_nucleotide(code_point) when code_point == ?\s, do: 0b0000
  def encode_nucleotide(code_point) when code_point == ?A, do: 0b0001
  def encode_nucleotide(code_point) when code_point == ?C, do: 0b0010
  def encode_nucleotide(code_point) when code_point == ?G, do: 0b0100
  def encode_nucleotide(code_point) when code_point == ?T, do: 0b1000

  def decode_nucleotide(encoded_code) when encoded_code == 0b0000, do: ?\s
  def decode_nucleotide(encoded_code) when encoded_code == 0b0001, do: ?A
  def decode_nucleotide(encoded_code) when encoded_code == 0b0010, do: ?C
  def decode_nucleotide(encoded_code) when encoded_code == 0b0100, do: ?G
  def decode_nucleotide(encoded_code) when encoded_code == 0b1000, do: ?T

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([], acc), do: acc
  defp do_encode([nucleotide | rest], acc) do
    acc = <<acc::bitstring, encode_nucleotide(nucleotide)::4>>
    do_encode(rest, acc)
  end

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<>>, acc), do: acc
  defp do_decode(<<nucleotide::4, rest::bitstring>>, acc) do
    acc = acc ++ [decode_nucleotide(nucleotide)]
    do_decode(rest, acc)
  end
end
