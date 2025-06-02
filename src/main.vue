<template>
  <navbar>
  </navbar>
  <main>
    <div id="hero">
      <p class="title">a gentle, garden-grown color palette</p>
      <p class="subtitle">
        Everviolet is all about keeping Evergarden alive and spreading its cozy
        vibes across different apps, editors, and tools. We’re here to make sure
        you get a beautiful, consistent experience everywhere. ✨
      </p>
    </div>
  </main>
</template>

<script setup lang="ts">
import navbar from "./components/navbar.vue";
</script>

<style>
p.title {
  font-size: 2.5rem;
  font-weight: 600;
}
p.subtitle {
  font-size: 1.25rem;
  margin-top: 0.5rem;
  color: var(--theme-subtext0);
}
</style>
