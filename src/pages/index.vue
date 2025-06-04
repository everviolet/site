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
          <div class="actions">
            <a class="button action-palette" href="/palette">Palette</a>
            <a class="button accent action-ports" href="/ports">Ports</a>
          </div>
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

<style scoped lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

#hero {
  display: flex;
  justify-content: space-around;
  height: 732px;

  >.container {
    display: flex;
    flex-direction: row;
    @include onmobile() {
      flex-direction: column;
    }
    width: 80%;

    >div{
      @include notmobile() {
        width: 50%;
      }
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
  margin: spacing(32) 0;
  color: var(--theme-subtext0);
}

.actions {
  display: flex;
  flex-direction: row;

  .button {
    &.action-palette {
    }
    &.action-ports {
    }
  }
}
</style>
