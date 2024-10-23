<script>
  import Sidebar from '/src/lib/component/sidebar.svelte';
  import Navbar from '/src/lib/component/navbar.svelte';

  export let page = "Selamat Datang";
  export let user = "Sri Apriliani";
  export let Manajemen = "Manajemen";
  let isDropdownOpen = false;

  // Define menu items with a dropdown
  const menuItems = [
    { name: "Beranda", href: "/beranda" }
  ];

  const toggleDropdown = (index) => {
    menuItems[index].isOpen = !menuItems[index].isOpen; // Toggle the dropdown for the clicked item
  };
</script>
  
<main class="layout">
  <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
  <div class="content">
    <Navbar {user} {page} />
    <h2>Menu Manajemen</h2>
    <div class="menu-container">
      <div class="menu-grid">
        <div class="menu-card">
            <img src="/src/lib/images/organisasi.svg" alt="organisasi"> 
            <a class="button button-blue" href="/MO/beranda">Manajemen Organisasi</a>
        </div>
        <div class="menu-card">
            <img src="/src/lib/images/komunitas.svg" alt="organisasi"> 
            <a class="button button-red" href="/MK/beranda">Manajemen Komunitas</a>
        </div>
        <div class="menu-card">
            <img src="/src/lib/images/situs.svg" alt="organisasi"> 
            <a class="button button-yellow" href="/MS/beranda">Manajemen Situs</a>
        </div>
        <div class="menu-card">
            <img src="/src/lib/images/sekretariat.svg" alt="organisasi"> 
            <a class="button button-green" href="/Sekret/beranda">Sekretaris</a>
        </div>
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

  h2 {
    margin-bottom: 20px;
    padding-left: 60px;    
    font-family: sans-serif;
  }
  .menu-container {
    display: flex;
    flex-direction: column;
    align-items: center; 

  }

  .menu-grid {
    display: grid;
    align-items: center;
    grid-template-columns: repeat(2,2fr);
    gap: 24px;
    padding: 20px;
    width: 100%;
    max-width: 1200px; /* Set a max width for better layout control */
  }

  .menu-card {
    display: grid;
    grid-template-columns: 1fr; /* One column */
    grid-auto-rows: auto; /* Automatically adjust row height */
    background-color: white; 
    border: solid 3px; 
    border-radius: 8px; 
    padding: 20px;
    gap: 24px;
    font-size: 16px; 
    font-weight: bold;
    justify-items: center;
    align-items: center;
  }

  .button {
    display: flex;
    justify-content: center;
    align-items: center;
    color: white; 
    border: none;
    border-radius: 25px;
    width: 274px;
    height: 59px;
    font-size: 16px; 
    font-weight: bold; 
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s; 
    text-decoration: none;
    font-family: sans-serif;
  }

  .button-blue {
      background-color: #004DA3;
  }

  .button-red {
      background-color: #FF565D;
  }

  .button-yellow {
      background-color: #FFCB05;
  }

  .button-green {
      background-color: #629A34;
  }

  .button:hover {
      transform: scale(1.05); 
  }

  .button-blue:hover {
      background-color: #00327A;
  }

  .button-red:hover {
      background-color: #C75155;
  }

  .button-yellow:hover {
      background-color: #D6A800;
  }

  .button-green:hover {
      background-color: #4B7A2E;
  }


  .menu-card:nth-child(1) {
    border: solid 3px;
    color: #004DA3;
  }

  .menu-card:nth-child(2) {
    color: #FF565D;
  }

  .menu-card:nth-child(3) {
    color: #FFCB05; 
  }

  .menu-card:nth-child(4) {
    color: #629A34;
  }

  /* Hover effects */
  .menu-card:hover {
    opacity: 0.8; /* Change opacity on hover */
  }
</style>
