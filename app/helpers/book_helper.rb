module BookHelper
  def cover_image_tag(book, width: 800, height: 600, dummy_img: false)
    if dummy_img 
      if book.cover_image.attached?
        generate_cover_image(book, width, height)
      else
        image_tag fake_img(width, height)
      end
    else
      generate_cover_image(book, width, height) if book.cover_image.attached?
    end
  end

  private
  def fake_img(width, height)
    "https://fakeimg.pl/#{width}x#{height}/?text=hello"
  end

  def generate_cover_image(book, width, height)
    image_tag book.cover_image.variant(resize: "#{width}x#{height}>", extent: "#{width}x#{height}")
  end
end

