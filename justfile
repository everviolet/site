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
  rsync -rltzv --delete --chmod=D750,F640 dist/ evergarden.ebil.club:.

format:
  pnpm run format

format-check:
  pnpm run format:check
