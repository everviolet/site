<template>
  <main>
    <div id="page">
      <div class="header">
        <h2>Ports</h2>
        <input
          class="form-control search header-component"
          type="text"
          v-model="query"
          placeholder="search"
        />
      </div>
      <ports :query="query" />
    </div>
  </main>
</template>

<script setup lang="ts">
import { ref } from "vue";
import ports from "@/components/ports.vue";

const query = ref("");
</script>

<style scoped lang="scss">
@use "@/styles/functions" as *;
</style>
