<template>
  <main>
    <div id="page">
      <div id="palette">
        <div class="header">
          <h2>Palette</h2>
          <select v-model="selected" aria-label="select variant" class="header-component">
            <option v-for="(v, i) in palettes" :value="i">{{ v.name }}</option>
          </select>
        </div>
        <palette :variant="selected" />
      </div>
    </div>
  </main>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue";
import palette from "@/components/palette.vue";
import palettes from "@/data/palettes.yml";

const selected = ref(window.matchMedia('(prefers-color-scheme: light)').matches ? 3 : 0);
</script>

<style scoped>
main {
  height: 100%;

  #page {
    #palette {
      .header {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        
        > select {
          font: inherit;
          font-weight: 600;
          cursor: pointer;
        }
      }
    }
  }
}
</style>
