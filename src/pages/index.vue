<template>
  <main>
    <div id="hero">
      <div class="container">
        <div class="description">
          <p class="title">a gentle, garden-grown color palette</p>
          <p class="subtitle">
          Everviolet is all about keeping Evergarden alive and spreading its cozy
          vibes across different apps, editors, and tools. We’re here to make sure
          you get a beautiful, consistent experience everywhere. ✨
          </p>
        </div>
        <div class="hero-image"></div>
      </div>
    </div>
    <div id="page">
      <palette/>
    </div>
  </main>
</template>

<script setup lang="ts">
import palette from "@/components/palette.vue";
</script>

<style scoped>

#hero {
  display: flex;
  justify-content: space-around;
  height: 732px;

  >.container {
    display: flex;
    flex-direction: row;
    width: 80%;

    >div{
      width: 50%;
    }
    div.description {
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
  }
}

p.title {
  font-size: 2.5rem;
  font-weight: 600;
}
p.subtitle {
  font-size: 1.4rem;
  margin-top: 0.5rem;
  color: var(--theme-subtext0);
}
</style>
