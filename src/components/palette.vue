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
import palette from '@/palette.yml'
</script>

<style>
h3 {
  margin: 1rem 0;

  text-transform: capitalize;
  color: var(--theme-subtext0);
}

.palette-colors {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 10px;
}
.swatch {
  .colorbox {
    height: 40px;
    border-radius: 16px;
    outline: 1px solid var(--theme-surface0);
  }
  .name {
    margin: .5rem 0;
    color: var(--theme-subtext0);
  }
}
</style>
