<template>
  <div class="palette-colors">
    <template v-for="color in v.colors">
      <swatch :color="color" :variant="variant" />
    </template>
  </div>
</template>

<script setup lang="ts">
import { computed } from "vue";
import swatch from "@/components/swatch.vue";
import palette from "@/data/palette.yml";

const { variant } = defineProps(["variant"]);

const v = computed(() => palette[variant]);
</script>

<style lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

.palette-colors {
  display: grid;
  width: 100%;
  margin: 0 0 5rem;

  grid-template-columns: repeat(24, 1fr);

  isolation: isolate;

  --skew: -15deg;

  @include onmobile() {
    grid-template-columns: unset;
    grid-template-rows: repeat(24, 6rem);
  }

  @include notmobile() {
    height: 40vh;
  }

  @include onmobile() {
    --skew: 0;
  }

  /* summer */
  .variants > :last-child .colorbox label {
    color: theme(text);
  }

  .swatch:nth-last-child(-n + 6) {
    .colorbox label {
      color: theme(text);
    }
    /* summer */
    .variants > :last-child .colorbox label {
      color: theme(crust);
    }
  }
}
</style>
