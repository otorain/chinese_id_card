require "time"
require "date"

module ChineseIdCard
  class Card
    attr_accessor :card_no
    attr_reader :birth_date, :gender, :age

    def initialize(card_no)
      @card_no = card_no
    end

    def parse!
      validate!

      if card_no.size == 18
        parse_length_18(card_no)
      else
        parse_length_15(card_no)
      end
    end

    def valid?
      length_valid? && format_valid?
    end

    private

    def validate!
      length_valid! && format_valid!
    end

    def parse_length_18(card_no)
      @birth_date = Date.parse(card_no[6...14])
      @age = calculate_age(birth_date)
      @gender = card_no[-2].to_i.odd? ? "male" : "female"

      self
    end

    def parse_length_15(card_no)
      @birth_date = Date.parse("19#{card_no[6...12]}")
      @age = calculate_age(birth_date)
      @gender = card_no[-1].to_i.odd? ? "male" : "female"

      self
    end

    def calculate_age(birth_date)
      ((current - birth_date.to_time) / seconds_of_one_year).floor
    end

    def current
      if Time.respond_to? :current
        Time.current
      else
        Time.now
      end
    end

    def seconds_of_one_year
      31556952
    end

    def length_valid?
      @card_no.size == 18 || @card_no.size == 15
    end

    def length_valid!
      if length_valid?
        true
      else
        raise CardNoLengthInvalidError, "Id card no length is invalid, expect 18 or 15, actual #{card_no.size}"
      end
    end

    def format_valid?
      regex = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)/
      !!regex.match(@card_no)
    end

    def format_valid!
      if format_valid?
        true
      else
        raise CardNoFormatInvalidError, "Id card no format is invalid"
      end
    end
  end
end
