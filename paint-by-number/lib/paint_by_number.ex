defmodule PaintByNumber do
  @init_size 1

  def palette_bit_size(color_count) do
    # Please implement the palette_bit_size/1 function
    determine_bitstring_size(color_count)
  end

  defp determine_bitstring_size(number, size \\ @init_size) do
    if Integer.pow(2, size) >= number do
      size
    else
      determine_bitstring_size(number, size + 1)
    end
  end

  def empty_picture() do
    # Please implement the empty_picture/0 function
    <<>>
  end

  def test_picture() do
    # Please implement the test_picture/0 function
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    size = palette_bit_size(color_count)
    pixel = <<pixel_color_index::size(size)>>
    <<pixel::bitstring, picture::bitstring>>
    # Please implement the prepend_pixel/3 function
  end

  def get_first_pixel(picture, color_count) do
    # Please implement the get_first_pixel/2 function
    case picture do
      <<>> ->
        nil

      _ ->
        size = palette_bit_size(color_count)
        <<first::size(size), _::bitstring>> = picture
        first
    end
  end

  def drop_first_pixel(picture, color_count) do
    # Please implement the drop_first_pixel/2 function
    case picture do
      <<>> ->
        ""

      _ ->
        size = palette_bit_size(color_count)
        <<_::size(size), rest::bitstring>> = picture
        rest
    end
  end

  def concat_pictures(picture1, picture2) do
    # Please implement the concat_pictures/2 function
    <<picture1::bitstring, picture2::bitstring>>
  end
end
