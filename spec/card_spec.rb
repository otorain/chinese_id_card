
RSpec.describe ChineseIdCard::Card do
  let(:card_no_18_chars_long) { "37142819800508053x" }
  let(:card_no_15_chars_long) { "370283790914202" }
  let(:card_no_length_invalid) { "37142819800508053123123123" }
  let(:card_no_format_invalid) { "3714281980a5080531" }

  describe ".parse!" do
    context "parse a valid card no" do
      context "with 18 characters long" do
        it "return a Card instance which with age, gender, birth_date attributes" do
          card = ChineseIdCard::Card.new(card_no_18_chars_long).parse!

          expect(card).to be_a(ChineseIdCard::Card)
          expect(card.age).to eq(41)
          expect(card.gender).to eq("male")
          expect(card.birth_date).to eq(Date.parse("1980.05.08"))
        end
      end

      context "with 15 characters long" do
        it "return a Card instance which with age, gender, birth_date attributes" do
          card = ChineseIdCard::Card.new(card_no_15_chars_long).parse!

          expect(card).to be_a(ChineseIdCard::Card)
          expect(card.age).to eq(42)
          expect(card.gender).to eq("female")
          expect(card.birth_date).to eq(Date.parse("1979.09.14"))
        end
      end
    end

    context "parse a invalid card no" do
      context "length is invalid" do
        it "raise ChineseIdCard::CardNoLengthInvalidError" do
          expect {
            ChineseIdCard::Card.new(card_no_length_invalid).parse!
          }.to raise_error(ChineseIdCard::CardNoLengthInvalidError)
        end
      end

      context "format is invalid" do
        it "raise ChineseIdCard::CardNoFormatInvalidError" do
          expect {
            ChineseIdCard::Card.new(card_no_format_invalid).parse!
          }.to raise_error(ChineseIdCard::CardNoFormatInvalidError)
        end
      end
    end
  end

  describe ".valid?" do
    context "parse a valid card no" do
      context "with 18 characters long" do
        it "return true" do
          card = ChineseIdCard::Card.new(card_no_18_chars_long)

          expect(card.valid?).to eq(true)
        end
      end

      context "with 15 characters long" do
        it "return true" do
          card = ChineseIdCard::Card.new(card_no_15_chars_long)

          expect(card.valid?).to eq(true)
        end
      end
    end

    context "parse a invalid card no" do
      context "length is invalid" do
        it "return false" do
          card = ChineseIdCard::Card.new(card_no_length_invalid)

          expect(card.valid?).to eq(false)
        end
      end

      context "format is invalid" do
        it "return false" do
          card = ChineseIdCard::Card.new(card_no_format_invalid)

          expect(card.valid?).to eq(false)
        end
      end
    end
  end
end
