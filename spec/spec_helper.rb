# frozen_string_literal: true

require "chinese_id_card"
require "chinese_id_card/card"
require "chinese_id_card/card_no_format_invalid_error"
require "chinese_id_card/card_no_length_invalid_error"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
