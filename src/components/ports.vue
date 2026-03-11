<template>
  <ul id="ports">
    <li v-for="port in results" class="port">
      <a :href="`https://codeberg.org/evergarden/${port.repo}`">
        <h3>{{ port.name || port.repo }}</h3>
        <p class="desc">
          <em>{{ port.desc }}</em>
        </p>
      </a>
    </li>
  </ul>
</template>

<script setup lang="ts">
import { ref, computed } from "vue";

import ports from "@/data/ports.yml";

const { query } = defineProps(["query"]);

const results = computed(() =>
  ports.filter((item) =>
    query.toLowerCase()
      .split(" ")
      .every(
        (v) =>
          item.repo.toLowerCase().includes(v) ||
          (item.name && item.name.toLowerCase().includes(v)),
      ),
  ),
);
</script>

<style scoped lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

#ports {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
  gap: spacing(16);

  list-style-type: none;
  padding: 0;

  .port {
    a {
      display: grid;
      grid-template-rows: 1fr 1fr;

      height: 8rem;
      padding: spacing(16);
    }

    background-color: theme(mantle);

    border-radius: 4px;

    font-size: font-size(22);

    transition: background-color 300ms ease-in-out;

    h3 {
      margin: 0 0 spacing(16);

      color: theme(subtext0);
    }

    .desc {
      font-size: font-size(16);
      line-height: 1.2;
      color: var(--theme-overlay1);
    }

    &:hover {
      background-color: theme(surface0);
    }
  }
}
</style>
