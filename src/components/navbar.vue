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

<style lang="scss">
@use "@/styles/functions" as *;

.navbar {
  position: sticky;
  width: 100%;
  height: 6rem;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 0 calc((100dvw - 80rem) / 2);

  &::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    opacity: 0;
    transition: opacity 0.3s ease;
    box-shadow: 0 0 1rem var(--theme-crust);
  }
  &:hover::after {
    opacity: 1;
  }
}

.navbar__name {
  font-size: font-size(36);
  font-weight: font-weight(semibold);
  color: theme(text);
  text-decoration: none;
}

.navbar__link {
  margin-left: spacing(32);
  font-size: font-size(20);
  font-weight: font-weight(medium);
  color: theme(text);
}
</style>
