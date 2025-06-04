<template>
  <nav class="navbar">
    <a href="/" class="navbar__name">Everviolet</a>
    <div class="navbar__links">
      <div class="navbar__link"><a href="/palette">Palette</a></div>
      <div class="navbar__link"><a href="/ports">Ports</a></div>
      <div class="navbar__link"><a>Resources</a></div>
      <div class="navbar__link"><a>Community</a></div>
      <div class="navbar__link"><a href="https://github.com/everviolet">GitHub</a></div>
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
@use "@/styles/responsive" as *;

.navbar {
  position: sticky;
  top: 0;
  width: 100%;
  height: 6rem;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 0 spacing(76);
  background-color: var(--theme-base);

  transition: height 100ms ease;

  @include onmobile() {
    position: unset;
    flex-direction: column;
    align-items: start;

    height: 8rem;
    padding: spacing(8) spacing(32);

    .navbar__links {
      align-self: center;
      overflow-x: scroll;

      width: 100%;
    }
  }

  .navbar__links {
    display: flex;
    flex-direction: row;

    height: 100%;
  }

  @include notmobile() {
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
}

.navbar__name {
  font-size: font-size(36);
  font-weight: font-weight(semibold);
  color: theme(text);
  text-decoration: none;

  &, &:hover {
    background-color: unset;
  }
}

.navbar__link {
  display: flex;
  flex-direction: row;
  align-items: center;

  line-height: 2.2rem;

  a {
    font-size: font-size(20);
    font-weight: font-weight(semibold);
    color: theme(text);
    background-color: transparent;

    padding: 0 spacing(12);

    &:hover {
      background-color: theme(surface0);
    }
  }

  & + &:before {
    content: "·";
    margin: 0 1.04rem;
    color: theme(overlay0);
    font-size: font-size(36);

    transition: margin 100ms ease;

    @include notmobile() {
      .navbar[data-scrolled="true"] & {
        margin: 0 2.08rem;
      }
    }
  }
}
</style>
