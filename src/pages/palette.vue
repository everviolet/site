<template>
  <main>
    <div id="page">
      <palette/>
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
    width: 80%;
    margin: 0 auto;
  }
}
</style>
