<template>
  <div class="swatch">
    <span class="header">
      <h3 class="name">
        {{ color.name }}
      </h3>
      <div class="colorbox" :style="{ 'background-color': hex }"></div>
    </span>
    <div class="desc">
      <p v-if="!!color.desc">
        {{ color.desc }}
      </p>
      <div class="syntax" v-if="!!color.syntax">
        <template v-for="type in color.syntax">
          <span :style="{ color: hex }">
            {{ type }}
          </span>
        </template>
      </div>
    </div>
    <div class="overlay">
      <div class="variants">
        <div v-for="variant in palettes">
          <colorbox
            :hex="variant.colors.find((c) => c.name == color.name).hex"
          />
          <span>
            {{ variant.name }}
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import colorbox from "@/components/colorbox.vue";

import palette from "@/data/palette.yml";
import palettes from "@/data/palettes.yml";

const { color } = defineProps(["color"]);

const { hex = "#000000" } = palettes[0].colors.find(
  (c) => c.name == color.name,
);
</script>

<style lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

.swatch {
  display: grid;
  grid-template-rows: 1fr auto;

  background-color: var(--theme-mantle);

  border-radius: 6px;
  padding: spacing(12);

  position: relative;
  overflow: hidden;

  .overlay {
    position: absolute;
    z-index: 2;
    inset: 0;

    opacity: 0;
    transition: opacity 100ms ease-out;

    & {
      display: flex;

      .variants {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        align-self: center;
        margin-inline: auto;
        padding: spacing(4);

        > div {
          display: grid;
          grid-template-rows: 1fr auto;
          gap: spacing(6);

          > * {
            margin-inline: auto;
          }

          > .colorbox {
            height: spacing(24);

            &.copy {
              cursor: pointer;
            }
          }

          > span {
            font-size: 0.8rem;
            text-transform: lowercase;
            color: var(--theme-subtext0);
          }
        }
      }
    }
  }
  &:hover .overlay {
    opacity: 1;
    background-color: inherit;
  }

  .colorbox {
    height: spacing(36);
    aspect-ratio: 1;
    border-radius: spacing(16);
    outline: 1px solid var(--theme-surface0);

    @include notdesktop() {
      height: spacing(24);
    }
  }
  .header {
    display: flex;
    justify-content: space-between;
    width: 100%;
  }
  .name {
    margin: spacing(8) 0;
    color: var(--theme-subtext0);
  }
  .desc {
    display: grid;
    grid-template-rows: 1fr;
    font-weight: 700;

    .syntax {
      display: flex;
      gap: 0.4rem;
      align-self: center;

      padding: 0.2rem;

      > span {
        background-color: var(--theme-surface0);
        padding: 0.5rem 0.8rem;
        border-radius: 6px;
        font-family: monospace;
        font-weight: 700;
      }
    }
  }
}
</style>
