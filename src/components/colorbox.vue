<template>
  <div
    @click="copyhex(hex)"
    class="colorbox copy"
    :style="{
      'background-color': hex,
    }"
  ></div>
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
