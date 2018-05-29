[![Gem Version](https://badge.fury.io/rb/permitted_attributes.svg)](https://badge.fury.io/rb/permitted_attributes)
[![Build Status](https://travis-ci.org/laurentzziu/permitted_attributes.svg?branch=master)](https://travis-ci.org/laurentzziu/permitted_attributes)

# PermittedAttributes

Gem to easily generate permitted attributes for `ActiveController::StrongParameters`

## Description

This gem adds the `permitted_attributes` class method, which returns all the model's column names as an `Array` of `symbols`, except the ones excluded (either by default: `id`, `created_at`, `updated_at`, or specified by user using the `excluded_attributes` method).

It uses the [`column_names`](http://api.rubyonrails.org/classes/ActiveRecord/ModelSchema/ClassMethods.html#method-i-column_names) `ActiveRecord` method to retrieve all the database column names.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'permitted_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install permitted_attributes

## Usage
Include `PermittedAttributes` module in the `ApplicationRecord` class.

```ruby
# app/models/application_record.rb
class ApplicationRecord < ActiveRecord::Base
  include PermittedAttributes
  ...
end
```

To exclude attributes per model, add
`excluded_attributes :name, :title` to your model.

Example:

```ruby
# app/models/post.rb
class Post < ApplicationRecord
  excluded_attributes :title, :category_id
  ...
end
```

```ruby
# app/models/category.rb
class Category < ApplicationRecord
  excluded_attributes :user_id, skip_defaults: true
  ...
end
```

Options:

* `skip_defaults`: _boolean_, default: `false`

Set to `true` in order to skip the default excluded attributes: `id`, `created_at`, `updated_at`.

Use the method in your controller:

```ruby
def post_params
  params.require(:post).permit(*Post.permitted_attributes, category_attributes: [*Category.permitted_attributes])
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/laurentzziu/permitted_attributes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PermittedAttributes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/laurentzziu/permitted_attributes/blob/master/CODE_OF_CONDUCT.md).
