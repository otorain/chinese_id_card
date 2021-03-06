# ChineseIdCard
A Gem for parse and validate personal info in id card no of chinese mainland. It supports 15 and 18 characters long card no.

[中文文档 Chinese document](/README-CN.md)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chinese_id_card'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install chinese_id_card

## Usage

### Parse user info
```ruby
valid_card_no = "37142819800508053x"
card = ChineseIdCard::Card.new(valid_card_no).parse!

p card.age # => 41
p card.gender # => "male" (The value of gender can be "male" or "female")
p card.birth_date # => #<Date: 1980-05-08 ((2444368j,0s,0n),+0s,2299161j)>

card_no_with_invalid_length = "37142819800508053x123"
ChineseIdCard::Card.new(card_no_with_invalid_length).parse! # => raise ChineseIdCard::CardNoLengthInvalidError

card_no_with_invalid_format = "a7142819800508053x"
ChineseIdCard::Card.new(card_no_with_invalid_format).parse! # => raise ChineseIdCard::CardNoFormatInvalidError
```

### Validate card no format
```ruby
valid_card_no = "37142819800508053x"
card = ChineseIdCard::Card.new(valid_card_no)
p card.valid? # => true

card_no_with_invalid_length = "37142819800508053x123"
card = ChineseIdCard::Card.new(card_no_with_invalid_length) 
p card.valid? # => false

card_no_with_invalid_format = "a7142819800508053x"
card = ChineseIdCard::Card.new(card_no_with_invalid_format)
p card.valid? # => false
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/chinese_id_card. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/chinese_id_card/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the ChineseIdCard project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/chinese_id_card/blob/master/CODE_OF_CONDUCT.md).
