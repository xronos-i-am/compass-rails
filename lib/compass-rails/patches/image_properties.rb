module Compass::Core::SassExtensions::Functions::ImageSize
  class ImageProperties
    def initialize(file)
      @file = if file.respond_to?(:to_path)
                file.to_path
              elsif file.respond_to?(:pathname)
                file.pathname
              else
                file
              end
      @file_type = File.extname(@file)[1..-1].downcase
      unless KNOWN_TYPES.include?(@file_type)
        raise Sass::SyntaxError, "Unrecognized file type: #{@file_type}"
      end
    end
  end
end
