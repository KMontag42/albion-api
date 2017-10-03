# albion-api

A Ruby API Library for Albion Online

# Disclaimer

I am actively updating this gem all the time, I recommend locking your version for now unless you want the new API calls.

# Install

```ruby
# Gemfile
gem 'albion-api', '~> 0.0'
```

or, you can of course install it via your shell.

```shell
$ gem install albion-api -v '~> 0.0'
```

# Supported API calls

* UserKillboard
* UserSearch
* GuildSearch
* GuildMembers

# Not Supported API calls

A bunch still haha, I haven't scraped all of them quite yet so an exhaustive list isn't here _yet_.

# Terms

**API IDs**: The Albion API operates off of internally generated API IDs for every objects in their database. This term refers to said ID for a given object.

# Usage

The simple way to use the library is as such:

```ruby
require 'albion-api'

client = AlbionApi::UserSearch.new('USER_NAME')
response = client.find
```

> More in depth details about each call to come.

# Contributing

Create a fork, and send me a PR! I am always happy to accept contributions.

Travis will be setup soon to run tests, so make sure you add them!
> the tests aren't 100% exhaustive yet, mainly just integration tests, so don't break your back for now ;)
