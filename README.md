# Hanami DB Provider Example

This app will raise an error because the `Parent` slice does not have a db configuration. To reproduce 

1. clone this repo
2. spin up the postgres server with `docker-compose up -d`
3. open a hanami console with `hanami c`
4. run `parent.boot`

## Notes

1. This bug also shows up in the typical `app` and `slice` combination I just missed it initially because I delete the app dir and move everything from it into `lib`
2. As hinted above removing the `db` directory from the `parent` will stop the bug from happening.

## Stacktrace

```ruby
test[development]> parent.boot
/Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/hanami-2.2.1/lib/hanami/providers/db.rb:194:in 'block (2 levels) in Hanami::Providers::DB#configure_gateways': A database_url for gateway default is required to start :db. (Hanami::ComponentLoadError)
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/hanami-2.2.1/lib/hanami/providers/db.rb:193:in 'Hash#fetch'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/hanami-2.2.1/lib/hanami/providers/db.rb:193:in 'block in Hanami::Providers::DB#configure_gateways'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/hanami-2.2.1/lib/hanami/providers/db.rb:192:in 'Hash#each'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/hanami-2.2.1/lib/hanami/providers/db.rb:192:in 'Hanami::Providers::DB#configure_gateways'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/hanami-2.2.1/lib/hanami/providers/db.rb:31:in 'Hanami::Providers::DB#finalize_config'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/hanami-2.2.1/lib/hanami/providers/db.rb:43:in 'Hanami::Providers::DB#prepare'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/provider.rb:234:in 'Kernel#public_send'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/provider.rb:234:in 'Dry::System::Provider#run_step'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/provider.rb:170:in 'Dry::System::Provider#start'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/provider_registrar.rb:163:in 'Hash#each_value'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/provider_registrar.rb:163:in 'Dry::System::ProviderRegistrar#finalize!'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/container.rb:325:in 'Array#each'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/container.rb:325:in 'block in Dry::System::Container.finalize!'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/container.rb:663:in 'Dry::System::Container.run_hooks'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/dry-system-1.2.2/lib/dry/system/container.rb:322:in 'Dry::System::Container.finalize!'
	from /Users/aaron/.local/share/mise/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/hanami-2.2.1/lib/hanami/slice.rb:330:in 'Hanami::Slice::ClassMethods#boot'
	... 9 levels...
test[development]> 
```
