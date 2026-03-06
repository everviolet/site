<template>
  <main>
    <div id="page">
      <div id="palette">
        <h2>Palette</h2>
        <palette />
      </div>
    </div>
  </main>
</template>

<script setup lang="ts">
import palette from "@/components/palette.vue";
</script>

<style scoped>
main {
  height: 100%;

  #page {
    #palette {
      > h2 {
        margin-bottom: 1rem;
      }
    }

    width: 80%;
    margin: 0 auto;
  }
}
</style>
