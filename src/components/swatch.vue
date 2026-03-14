<template>
  <div class="swatch">
    <div class="bg" :style="{ color: hex, 'background-color': hex }"></div>
    <div class="overlay">
      <div class="variants">
        <div v-for="(v, i) in palette">
          <span>
            {{ v.name }}
          </span>
          <colorbox :style="{ 'z-index': 5 }" :hex="colorFor(color, i)" />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from "vue";

import palette from "@/data/palette.yml";
import colorbox from "@/components/colorbox.vue";

const { color, variant } = defineProps(["color", "variant"]);
const hex = computed(() => colorFor(color, variant));

const colorFor = (clr, v) => palette[v].colors.find(c => c.name == clr.name).hex;
</script>

<style lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

@keyframes overlay {
  from {
    translate: var(--before);
    z-index: initial;
  }

  to {
    transform: var(--after);
    z-index: var(--new-z-index);
  }
}
@keyframes overlay-out {
  from {
    transform: var(--after);
    z-index: var(--new-z-index);
  }

  99% {
    z-index: var(--new-z-index);
  }
  to {
    translate: var(--before);
    z-index: initial;
  }
}

.swatch {
  position: relative;

  height: 100%;
  width: 100%;

  .bg {
    position: absolute;
    inset: 0;
  }

  &:hover .overlay {
    opacity: 1;
    background-color: inherit;
  }

  @include notmobile() {
    .bg {
      --before: skew(var(--skew)) scaleX(104%);
      --after: skew(var(--skew)) scaleX(200%);
      --new-z-index: 3;

      transform: skew(var(--skew)) scaleX(104%);
      animation: overlay-out 100ms forwards;
    }

    &:hover .bg {
      animation: overlay 150ms forwards;
    }
  }

  .overlay {
    position: absolute;
    z-index: 100;
    inset: 0;
    height: 100%;

    @include notmobile() {
      left: -25%;
    }

    opacity: 0;
    transition: opacity 100ms ease-out;

    & {
      display: flex;

      .variants {
        display: grid;
        grid-template-rows: repeat(4, 1fr);
        align-self: center;
        margin-inline: auto;
        padding: spacing(4);
        gap: spacing(6);

        @include onmobile() {
          grid-template-rows: unset;
          grid-template-columns: repeat(4, 1fr);
        }

        > div {
          display: grid;
          grid-template-rows: 1fr auto;
          gap: spacing(6);

          > * {
            margin-inline: auto;
          }

          > span {
            text-transform: lowercase;
            color: theme(text);
            background-color: theme(mantle);
            padding: 0 1rem;
          }
        }
      }
    }
  }
}
</style>
