<script lang="ts">
  import { page } from '$app/stores';
  import { get } from 'svelte/store';

  export let buttons: { text: string; href: string }[] = [];
  let activeIndex: number = 0;

  // Function to determine active tab based on URL
  function initializeActiveTab() {
    const currentPath = get(page).url.pathname; // Get current URL path
    activeIndex = buttons.findIndex((button) => currentPath.startsWith(button.href));
    if (activeIndex === -1) {
      activeIndex = 0; // Default to first tab if no match
    }
  }

  // Function to set the active tab when clicked
  function setActive(index: number) {
    activeIndex = index;
  }

  // Initialize the active tab based on URL when component is loaded
  initializeActiveTab();
</script>

<!-- Tab Container -->
<div class="tab-container">
{#each buttons as button, index}
  <button
    class:active={index === activeIndex}
    class="tab-button"
    on:click={() => setActive(index)}
  >
    <a href={button.href}>{button.text}</a>
  </button>
{/each}
</div>

<style>
.tab-container {
  display: flex;
  gap: 10px;
  justify-content: center;
  padding: 10px;
}

.tab-button {
  padding: 10px 20px;
  border-radius: 20px;
  background-color: #e0e0e0;
  border: none;
  cursor: pointer;
  text-align: center;
  transition: background 0.3s;
  font-family: 'Poppins', sans-serif;
}

.tab-button a {
  text-decoration: none;
  color: inherit;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.tab-button.active {
  background-color: #007bff;
  color: white;
}

@media (max-width: 600px) {
  .tab-container {
    flex-direction: column;
    align-items: stretch;
  }

  .tab-button {
    width: 100%;
    margin: 0.5rem 0;
  }
}
</style>
