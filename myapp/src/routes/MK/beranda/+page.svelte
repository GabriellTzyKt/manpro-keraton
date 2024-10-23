<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';
  
    export let page = "Daftar Komunitas";
    export let user = "Sri Apriliani";
    export let Manajemen = "Komunitas";
    export let organisasi = "Sinau Batik";
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
                        <img src="/src/lib/images/profileicon.png" alt="organisasi"> 
                        <span>{organisasi}</span>
                        <div class="button-layout">
                            <button class="button">Details</button>
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
        align-items: start; /* Align items to the start */
        grid-template-columns: repeat(4, 1fr); /* Ensure equal width for each column */
        gap: 24px;
        padding: 20px;
        width: 100%;
        max-width: 1200px; /* Set a max width for better layout control */
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
        background-color: #004DA3;
        border: none;
        border-radius: 10px;
        width: 100%; /* Full width for button */
        height: 59px;
        font-size: 16px; 
        font-weight: bold; 
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s; 
    }
  
    .button:hover {
        background-color: #0015ff; /* Darker blue */
    }
  
    .menu-card:hover {
        opacity: 0.8; /* Change opacity on hover */
    }
  </style>
  