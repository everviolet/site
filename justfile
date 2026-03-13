default: build

prefix := 'out'

dev:
  pnpm run dev

build:
  pnpm run build

install:
  mkdir -p {{prefix}}
  cp -r dist/* {{prefix}}

push:
  @just build
  rsync -rltzv \
    --delete \
    --chmod=D755,F644 \
    --exclude userstyles \
    --exclude gitea \
    dist/ evergarden.ebil.club:.

format:
  pnpm run format

format-check:
  pnpm run format:check
