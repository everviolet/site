default: build

prefix := 'out'

dev:
  pnpm run dev

build:
  pnpm run build

install:
  mkdir -p {{prefix}}
  cp -r dist/* {{prefix}}

format:
  pnpm run format

format-check:
  pnpm run format:check
