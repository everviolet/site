<template>
  <div class="header">
    <h2>Ports</h2>
    <div class="search-wrapper">
      <input class="form-control search" type="text" v-model="searchQuery" placeholder="search" />
    </div>
  </div>
  <ul id="ports">
    <li v-for="port in results" class="port">
      <a :href="`https://github.com/everviolet/${port.repo}`">
        <h3>{{port.name}}</h3>
        <em>{{port.desc}}</em>
      </a>
    </li>
  </ul>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'

import ports from '@/data/ports.yml'

const searchQuery = ref('')

const results = computed(() =>
  ports.filter(item =>
    searchQuery.value.toLowerCase().split(' ').every(
      v => item.name.toLowerCase().includes(v))))
</script>

<style scoped lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

.header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;

  margin: spacing(8) 0 spacing(16);

  .search-wrapper {
    display: grid;
  }

  input {
    width: 20rem;
  }

  @include onmobile() {
    flex-direction: column-reverse;
    align-items: start;
    gap: spacing(16);

    .search-wrapper {
      width: 100%;
    }
    input {
      justify-self: center;
      width: min(100%, 32rem);
    }
  }
}

#ports {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
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

    em {
      color: var(--theme-overlay1);
    }

    &:hover {
      background-color: theme(surface0);
    }
  }
}
</style>
