<template>
  <div
    @click="copyhex(hex)"
    class="colorbox copy"
    :style="{
      'background-color': hex,
    }"
  >
    <label>{{ hex }}</label>
  </div>
</template>

<script setup lang="ts">
const { hex } = defineProps(["hex"]);

async function writeClipboardText(text) {
  try {
    await navigator.clipboard.writeText(text);
  } catch (error) {
    console.error(error.message);
  }
}

function copyhex(event) {
  writeClipboardText(event);
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
