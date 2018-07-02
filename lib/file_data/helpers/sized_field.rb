require_relative 'stream_view'
require_relative '../core_extensions/binary_extensions'

module Helpers
  class SizedField
    include BinaryExtensions

    def self.create_view(view, size_len)
      content_size = view.read_value(size_len) - size_len
      SubStreamView.new(view.stream, view.stream.pos, content_size)
    end
  end
end