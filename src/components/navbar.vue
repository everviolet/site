<template>
  <nav class="navbar">
    <a href="/" class="navbar__name">Everviolet</a>
    <div class="navbar__links">
      <a class="navbar__link">Palette</a>
      <a class="navbar__link">Ports</a>
      <a class="navbar__link">Community</a>
      <a class="navbar__link">GitHub</a>
    </div>
  </nav>
</template>

<script setup lang="ts">
import { onMounted, onBeforeUnmount } from "vue";

let navObserver

onMounted(() => {
  const navbar = document.querySelector(".navbar");
  const scrollwatcher = document.createElement("div");
  scrollwatcher.setAttribute("data-scrollwatcher", "");
  navbar.before(scrollwatcher);

  navObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      navbar.setAttribute("data-scrolled", !entry.isIntersecting);
    });
  });

  navObserver.observe(scrollwatcher);
});
onBeforeUnmount(() => {
  navObserver.disconnect()
  document.querySelector("[data-scrollwatcher]").remove();
})
</script>

<style lang="scss">
@use "@/styles/functions" as *;

.navbar {
  position: sticky;
  top: 0;
  width: 100%;
  height: 6rem;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 0 calc((100dvw - 80rem) / 2);
  background-color: var(--theme-base);

  transition: height 100ms ease;

  .navbar__links {
    display: flex;
    flex-direction: row;
  }

  &::after {
    content: "";
    position: absolute;
    z-index: -1;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    opacity: 0;
    transition: opacity 0.3s ease;
    box-shadow: 0 0 1rem var(--theme-crust);
  }
  &[data-scrolled="true"] {
    height: 4rem;

    &::after {
      opacity: 1;
    }
  }
}

.navbar__name {
  font-size: font-size(36);
  font-weight: font-weight(semibold);
  color: theme(text);
  text-decoration: none;
}

.navbar__link {
  font-size: font-size(20);
  font-weight: font-weight(medium);
  color: theme(text);

  & + &:before {
    content: "·";
    margin: 0 1.04rem;
    color: theme(overlay0);

    transition: margin 100ms ease;

    .navbar[data-scrolled="true"] & {
      margin: 0 2.08rem;
    }
  }
}
</style>
