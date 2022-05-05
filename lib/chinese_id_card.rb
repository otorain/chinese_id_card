# frozen_string_literal: true

require_relative "chinese_id_card/version"
require_relative 'chinese_id_card/card'
require_relative 'chinese_id_card/card_no_length_invalid_error'
require_relative 'chinese_id_card/card_no_format_invalid_error'

module ChineseIdCard
  class Error < StandardError; end
end
