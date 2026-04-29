# SynthGain

SynthGain is a niche marketplace for buying and selling vintage synthesizers. The product idea stays intentionally focused: a cleaner, more trustworthy experience for specialist gear than a generic classifieds site.

This repo keeps the original Rails marketplace stack and concept, but refactors the app toward a more polished standard:

- clearer buyer and seller flows
- stronger presentation of listings and seller profiles
- cleaner helper and controller responsibilities
- improved seed data for local demos
- a more intentional visual system for recruiters and collaborators reviewing the codebase

## Stack

- Ruby on Rails 6.1
- PostgreSQL
- Webpacker 5
- Bootstrap 5
- Devise
- Ransack
- Active Storage
- Stripe Checkout
- RSpec

## Product Flow

### Buyers

- browse the marketplace
- filter by title/description and category
- inspect seller profiles
- purchase listings through Stripe

### Sellers

- create a seller profile
- publish synth listings with metadata and imagery
- edit or remove existing listings
- track purchases through the orders page

## Key App Areas

- `app/controllers/listings_controller.rb`
  Marketplace listings, seller ownership checks, and Stripe session creation.
- `app/controllers/users_info_controller.rb`
  Seller profile creation, editing, and public seller profile pages.
- `app/views/pages/home.html.erb`
  Landing page and recruiter-facing first impression.
- `app/views/listings/`
  Marketplace cards, listing detail, and listing form flow.
- `app/assets/stylesheets/application.scss`
  Global design system and page-level styling.

## Local Setup

This repo now runs reliably on Apple Silicon/macOS with the following local baseline:

- Ruby `3.0.6`
- Bundler `2.2.18`
- PostgreSQL
- Node.js LTS recommended
- Yarn `1.22.x`

If your shell has proxy variables configured, strip them for installs:

```bash
env -u HTTP_PROXY -u HTTPS_PROXY -u http_proxy -u https_proxy <command>
```

Bootsnap can be unstable on newer macOS toolchains with this older Rails stack, so the setup commands below explicitly disable it.

Example flow:

```bash
env -u HTTP_PROXY -u HTTPS_PROXY -u http_proxy -u https_proxy \
PATH="$HOME/.asdf/installs/ruby/3.0.6/bin:$PATH" \
bundle _2.2.18_ install

env -u HTTP_PROXY -u HTTPS_PROXY -u http_proxy -u https_proxy \
corepack yarn install

env -u HTTP_PROXY -u HTTPS_PROXY -u http_proxy -u https_proxy \
DISABLE_BOOTSNAP=1 \
PATH="$HOME/.asdf/installs/ruby/3.0.6/bin:$PATH" \
bundle _2.2.18_ exec rails db:setup

env -u HTTP_PROXY -u HTTPS_PROXY -u http_proxy -u https_proxy \
DISABLE_BOOTSNAP=1 \
PATH="$HOME/.asdf/installs/ruby/3.0.6/bin:$PATH" \
bundle _2.2.18_ exec rails server -p 3001
```

Then visit `http://localhost:3001`.

## Demo Accounts

- `test@test.com` / `testing`
- `mrtest@test.com` / `testing`
- `mrstest@test.com` / `testing`

## Notes

- Checkout requires valid Stripe credentials in Rails credentials.
- Development uses local Active Storage so the app boots without S3.
- Seed data is designed to give the app a cleaner local demo without needing manual setup.
- `bin/webpack` and `bin/webpack-dev-server` set `--openssl-legacy-provider` automatically so Webpacker 5 can still compile on modern Node/OpenSSL combinations.
- Native gem build flags for `nio4r`, `msgpack`, and `ffi` are stored in `.bundle/config` for repeatable local installs on current macOS toolchains.

## Why This Repo Matters

SynthGain is useful as a portfolio project because it shows:

- full-stack Rails product work
- authentication and account flows
- marketplace domain modeling
- payments integration
- server-rendered UI design and refactoring discipline
- willingness to revisit older work and raise the engineering standard
