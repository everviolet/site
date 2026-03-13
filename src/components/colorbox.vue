<template>
  <div
    @click="copyhex(hex)"
    class="colorbox copy"
    :style="{
      'background-color': hex,
    }"
  >
    <label>{{ label }}</label>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";

const { hex, visible } = defineProps(["hex", "visible"]);
const label = ref(hex);

async function writeClipboardText(text) {
  try {
    await navigator.clipboard.writeText(text);
  } catch (error) {
    console.error(error.message);
  }
}

function copyhex(event) {
  if (!visible) return;

  writeClipboardText(event);

  label.value = "copied!";
  setTimeout(() => {
    label.value = hex;
  }, 1000);
}
</script>

<style lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

.colorbox {
  height: spacing(24);
  aspect-ratio: 1;
  border: 1px solid theme(surface0);
  border-radius: 6px;
  padding: 0 1rem;

  label {
    font-size: font-size(12);
    color: theme(crust);
  }

  &.copy {
    position: relative;

    &:hover {
      border-color: theme(overlay0);
    }
  }
}
</style>
