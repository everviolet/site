<template>
  <div id="palette">
    <h2>Palette</h2>
    <div v-for="variant in palette">
      <h3>{{variant.name}}</h3>
      <div class="palette-colors">
        <div v-for="color in variant.colors" class="swatch">
          <div class="colorbox" :style="{ 'background-color': '#' + color.hex }"></div>
          <div class="name">
            {{color.name}}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import palette from '@/data/palette.yml'
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
  grid-template-columns: repeat(12, 1fr);
  gap: spacing(8);

  @include notdesktop() {
    grid-template-columns: repeat(4, 1fr);
  }
}
.swatch {
  .colorbox {
    @include notdesktop() {
      height: 60px;
    }
    height: 40px;
    border-radius: 16px;
    outline: 1px solid var(--theme-surface0);
  }
  .name {
    margin: spacing(8) 0;
    color: var(--theme-subtext0);
  }
}
</style>
