<script>
  import { onMount } from 'svelte';

  export let Manajemen;
  export let menuItems = []; // Default to an empty array
  export let toggleDropdown; // Function to toggle dropdown

  // Reactive variable to track the active path
  let activePath = '';

  // onMount lifecycle hook to handle setting the active class
  onMount(() => {
    if (typeof window !== 'undefined') {
      activePath = window.location.pathname;
      menuItems.forEach((menuItem) => {
        if (menuItem.subItems) {
          menuItem.subItems.forEach((subItem) => {
            if (activePath.startsWith(subItem.href)) {
              menuItem.isOpen = true; // Open the dropdown
            }
          });
        }
      });
    }
  });
</script>


<div class="sidebar">
  <a href="../../../beranda">
    <img src="/src/lib/images/logo.svg" alt="Logo" class="logo" />
  </a>
  <div class="menu">Menu {Manajemen}</div>

  {#each menuItems as item, index}
    {#if item.dropdown}
      <div
        class="menu-item"
        on:click={() => toggleDropdown(index)}
        role="button"
        tabindex="0"
        on:keydown={(e) => e.key === 'Enter' && toggleDropdown(index)}
      >
        <span>{item.name}</span>
        <span class="arrow">{item.isOpen ? '▲' : '▼'}</span>
      </div>

      {#if item.isOpen}
        <div class="dropdown">
          {#each item.subItems as subItem}
            <a
              href="{subItem.href}"
              class="menu-item"
              class:active={activePath.startsWith(subItem.href)}
            >
              {subItem.name}
            </a>
          {/each}
        </div>
      {/if}
    {:else}
      <a
        href="{item.href}"
        class="menu-item"
        class:active={activePath.startsWith(item.href)}
      >
        {item.name}
      </a>
    {/if}
  {/each}
</div>


<style>
  
  .sidebar {
    height: 100vh; /* Full viewport height */
    width: 250px;
    background-color: #0B2E4B;
    color: white;
    display: flex;
    flex-direction: column;
    padding-top: 20px;
    position: fixed; /* Fix to the left side of the screen */
    overflow-y: auto;
    align-items: center;
    top: 0;
    left: 0;
    bottom: 0;
    flex-grow: 1;
    margin: 0; /* Remove any potential margin */
    padding: 0; /* Ensure no extra padding is added */

  }

  .logo {
    width: 100px;
    height: auto;
    margin-bottom: 40px; /* Adjust margin as necessary */
    align-self: center; /* Ensure the logo is centered */
    display: block; /* Ensures it behaves like a block element */
    text-decoration: none; /* Remove underline from link */
  }


  .menu {
    font-size: 1.5em;
    margin-bottom: 20px;
    padding-left: 16px;
    text-align: left;
    color: #89DCF0;
    font-family: sans-serif;

  }

  .menu-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-left: 24px;
    padding-right: 24px;
    padding-top: 12px;
    padding-bottom: 12px;
    border-radius: 10px;
    width: 80%;
    margin-bottom: 16px;
    text-decoration: none;
    color: white;
    font-family: sans-serif;
    cursor: pointer;
    
  }

  .menu-item:is(.active) {
    background-color: white;
    color: #0B2E4B;
  }

  .menu-item:hover {
    background-color: #f0f0f0;
    color: black;
  }

  .dropdown {
    padding-left: 20px;
    margin-bottom: 10px;
  }

  .dropdown .menu-item {
    background-color: transparent; /* Default for dropdown items */
    display: flex;
  }

  .dropdown .menu-item:hover {
    background-color: #f0f0f0; /* Highlight on hover */
  }

  .dropdown .menu-item.active { /* Active state for dropdown items */
    background-color: white; /* White background for active dropdown item */
    color: #0B2E4B; /* Change text color */
  }

  .arrow {
    margin-left: auto; /* Pushes the arrow to the right */
  }
</style>
