<template>
  <main>
    <header>
      <h1>evergarden</h1>
      <p>
        evergarden is a colorscheme inspired by lush forests, enchanted groves, and the
        calm of nature. It was also inspired by the lively art of The Legend of Zelda: The
        Minish Cap. It's designed to be easy on the eyes, elegant, and just plain nice to
        look at - whether you're coding, writing, or just staring at your terminal for fun
        (we won't judge).
      </p>
    </header>
    <palette :variant="initialVariant" />
  </main>
  <div id="drawer">
    <div id="drawer-bar">
      <div class="drawer-toggle">
        <label noselect for="ports-toggle">ports</label>
        <input type="checkbox" name="ports" id="ports-toggle" />
      </div>
      <div class="links">
        <a href="https://codeberg.org/evergarden">codeberg</a>
        <a href="https://github.com/everviolet">github</a>
        <a href="https://codeberg.org/evergarden/.profile">resources</a>
        <a href="https://robinwobin.dev/redirect/discord">discord</a>
        <a href="https://bsky.app/profile/did:plc:yyfc3u72l35gztckwgnw2g6c">bluesky</a>
      </div>
    </div>
    <section id="ports-drawer" class="drawer">
      <ports />
    </section>
  </div>
  <div class="dim-overlay"></div>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue";
import palette from "@/components/palette.vue";
import ports from "@/components/ports.vue";

const initialVariant = ref(0);
onMounted(() => {
  initialVariant.value = window.matchMedia("(prefers-color-scheme: light)").matches
    ? 3
    : 0;
});
</script>

<style lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

#app {
  height: 100%;
  width: 100%;
}

main {
  display: grid;
  grid-template:
    "title" 1fr
    "palette" 1fr
    / 1fr;

  height: 100%;

  @include onmobile() {
    grid-template:
      "title" 1fr
      "palette" auto
      / 1fr;
  }

  header {
    margin: 5rem auto 4rem;
    max-width: 90ch;

    display: grid;
    grid-template: auto 1fr / 1fr;

    @include onmobile() {
      margin: 3rem 1rem;
    }

    h1 {
      font-size: font-size(56);
    }

    p {
      font-size: font-size(20);
      line-height: 1.4;
      margin: 1rem 0 0;

      @include onmobile() {
        font-size: font-size(16);
        margin: 2rem 0 0;
      }
    }
  }
}

#drawer {
  position: fixed;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 100;
  isolation: isolate;

  display: grid;
  grid-template-rows: auto 1fr;

  #drawer-bar {
    display: flex;
    flex-direction: row;
    justify-content: space-between;

    width: 100%;
    overflow: hidden;

    gap: var(--padding);

    --padding: 1rem;

    .links {
      display: flex;
      flex-direction: row;
      background-color: theme(mantle);

      padding: 0 var(--padding);
      gap: var(--padding);

      overflow-x: scroll;
    }
  }
}

.drawer-toggle {
  background-color: theme(mantle);
  z-index: 2;
  padding: 0 var(--padding);
  width: min-content;

  input {
    appearance: none;
  }

  &:has(input:checked) {
    background-color: theme(base);
  }
}
section.drawer {
  background-color: theme(mantle);
  height: 0;
  width: 100%;

  overflow-y: scroll;

  transition:
    background-color 200ms ease-in,
    height 200ms ease-in;

  #drawer-bar:has(.drawer-toggle input:checked) + & {
    height: 80vh;
    background-color: theme(base);
  }
}

.dim-overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: theme(crust);
  z-index: 1;
  pointer-events: none;

  transition: opacity 200ms ease-in;
  opacity: 0;

  #drawer:has(#drawer-bar .drawer-toggle input:checked) + & {
    opacity: 0.8;
  }
}
</style>
