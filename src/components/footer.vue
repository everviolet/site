<template>
  <footer>
    <p>&copy; Evergarden</p>
    <div class="links">
      <a href="https://robinwobin.dev/redirect/discord">Discord</a>
      <a href="https://bsky.app/profile/did:plc:yyfc3u72l35gztckwgnw2g6c">Bluesky</a>
      <a href="https://codeberg.org/evergarden/.profile">Resources</a>
      <a href="https://codeberg.org/evergarden">Codeberg</a>
    </div>
  </footer>
</template>

<style lang="scss">
@use "@/styles/functions" as *;
@use "@/styles/responsive" as *;

footer {
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  padding: 2rem 4.75rem;

  > p {
    color: theme(overlay0);
  }

  .links {  
    display: flex;
  }

  .links a + a:before {
    content: "·";
    margin: 0 0.75rem;
    color: theme(overlay0);

    @include onmobile() {
      margin: 0 0.4rem;
    }
  }

  @include onmobile() {
    align-items: center;
    flex-direction: column;
  }
}
</style>
