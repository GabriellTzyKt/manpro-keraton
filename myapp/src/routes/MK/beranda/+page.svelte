<script>
  import Sidebar from '/src/lib/component/sidebar.svelte';
  import Navbar from '/src/lib/component/navbar.svelte';

  export let page = "Daftar Komunitas";
  export let user = "Sri Apriliani";
  export let Manajemen = "Komunitas";
  export let komunitas = "Nama Komunitas";
  let isDropdownOpen = false;

  // Define menu items with a dropdown
  const menuItems = [
    { name: "Beranda", href: "/beranda" },
  ];

  const toggleDropdown = (index) => {
    menuItems[index].isOpen = !menuItems[index].isOpen; // Toggle the dropdown for the clicked item
  };
</script>
  
<main class="layout">
  <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
  <div class="content">
      <Navbar {user} {page} />
      <div class="menu-container">
          <div class="menu-grid">
              {#each Array(8) as _, index}
                  <div class="menu-card">
                      <img src="/src/lib/images/profileicon.svg" alt="komunitas"> 
                      <span>{komunitas}</span>
                      <div class="button-layout">
                          <a class="button" href="/MK/dashboard">Details</a>
                      </div>
                  </div>
              {/each}
          </div>
      </div>
  </div>
</main>

<style>
  .layout {
      display: flex;
      height: 100vh;
      font-family: sans-serif;
  }

  .content {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      margin-left: 250px;
  }

  .menu-container {
      display: flex;
      padding-top: 64px;
      flex-direction: column;
      align-items: center; 
  }

  .menu-card span {
      color: black;
      font-family: sans-serif;
      font-size: large;
  }

  .menu-grid {
      display: grid;
      align-items: start; 
      grid-template-columns: repeat(4, 1fr); 
      gap: 24px;
      padding: 20px;
      width: 100%;
      max-width: 1200px;
  }

  .menu-card {
      display: flex;
      flex-direction: column; /* Use column layout */
      background-color: white; 
      border: solid 1px; 
      border-radius: 8px; 
      padding: 20px;
      gap: 12px; /* Adjust gap for better spacing */
      font-size: 16px; 
      font-weight: bold;
      justify-content: space-between; /* Space items evenly */
      align-items: center;
      width: 240px; /* Fixed width for uniformity */
      height: 240px; /* Fixed height for uniformity */
  }

  .button-layout {
      display: flex;
      justify-content: flex-end;
      width: 100%;
  }

  .button {
      color: white; 
      font-family: sans-serif;
      background-color: #004DA3;
      border: none;
      border-radius: 10px;
      width: 100%; /* Full width for button */
      height: 59px;
      font-size: 16px; 
      font-weight: bold; 
      cursor: pointer;
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
      text-decoration: none; /* Remove underline from <a> */
      transition: background-color 0.3s, transform 0.3s; 
  }

  .button:hover {
      background-color: #0015ff; /* Darker blue */
  }

  .menu-card:hover {
      opacity: 0.8; /* Change opacity on hover */
  }
</style>
