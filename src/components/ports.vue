<template>
  <ul role="list" class="ports">
    <li v-for="port in results" class="port">
      <span>
        <h3>
          <a :href="`https://codeberg.org/evergarden/${port.repo}`">
            {{ port.name || port.repo }}
          </a>
        </h3>
        <p class="desc">
          {{ port.desc }}
        </p>
      </span>
    </li>
  </ul>
</template>

<script setup lang="ts">
import { ref, computed } from "vue";

import ports from "@/data/ports.yml";

const query = ref("");

const results = computed(() =>
  ports.filter(item =>
    query.value
      .toLowerCase()
      .split(" ")
      .every(
        v =>
          item.repo.toLowerCase().includes(v) ||
          (item.name && item.name.toLowerCase().includes(v)),
      ),
  ),
);
</script>

<style lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

ul[role="list"].ports {
  display: grid;
  grid-template-columns: repeat(3, 1fr);

  gap: 1rem;
  margin: 1rem 0 2rem;

  @include onmobile() {
    grid-template-columns: 1fr;
  }

  li.port {
    padding: 0.2rem 0.5rem;

    span {
      h3 {
        margin: 0.2rem 0rem 0.4rem;
      }

      .desc {
        color: theme(subtext0);
      }
    }
  }
}
</style>
