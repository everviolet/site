default: build

prefix := 'out'

whiskers:
  whiskers src/palette.tera
  whiskers src/styles.tera
  whiskers index.txt.tera -f winter

dev:
  @just whiskers
  pnpm run dev

build:
  @just whiskers
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
