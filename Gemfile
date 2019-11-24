source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.4.4"

gem "bcrypt", "3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap"
gem "carrierwave", "1.2.2"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "cloudinary"
gem "faker", github: "stympy/faker"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "kaminari"
gem "mini_magick", "4.9.4"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
gem "ransack"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "mysql2", ">= 0.4.4", "< 0.6.0"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "pg", "1.0.0"
  gem "fog", "1.38.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
