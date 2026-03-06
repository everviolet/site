<template>
  <div class="palette-colors">
    <template v-for="color in palette.colors">
      <swatch :color="color" />
    </template>
  </div>
</template>

<script setup lang="ts">
import palette from "@/data/palette.yml";
import swatch from "@/components/swatch.vue";
</script>

<style lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

h3 {
  margin: spacing(16) 0;

  text-transform: capitalize;
  color: var(--theme-subtext0);
}

.palette-colors {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: spacing(8);

  @include notdesktop() {
    grid-template-columns: repeat(2, 1fr);
  }
}
</style>
