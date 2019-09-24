require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :validation_helpers

  def process(io, context)
    resize_to_limit(io.download, 700, 700) if context[:phase] == :store
  end

  def generate_location(io, context)
    super unless context[:record]
    "#{context[:record].class}/#{context[:record].id}/#{super}"
  end

  Attacher.validate do
    validate_mime_type_inclusion ['image/png', 'image/jpeg']
  end
end
