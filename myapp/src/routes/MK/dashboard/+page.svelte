<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';
  
    export let page = "Selamat Datang";
    export let user = "Sri Apriliani";
    export let Manajemen = "Komunitas";
    let isDropdownOpen = false;
  
    // Define menu items with a dropdown
    const menuItems = [
      { name: "Dashboard", href: "/MK/dashboard" },
      {
        name: "Komunitas",
        dropdown: true,
        subItems: [
          { name: "Detail Komunitas", href: "/MK/komunitas/detailK" },
          { name: "Daftar Anggota", href: "/MK/komunitas/daftarA" },
          { name: "Acara", href: "/MK/komunitas/acara" }
        ]
      },
    ];
  
    const toggleDropdown = (index) => {
      menuItems[index].isOpen = !menuItems[index].isOpen; // Toggle the dropdown for the clicked item
    };
  </script>
    
  <main class="layout">
    <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
    <div class="content">
      <Navbar {user} {page} />
      <h2>Dashboard</h2>
      <div class="menu-container">
        
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
  
    h2 {
      margin-bottom: 20px;
      padding-left: 36px;    
      font-family: sans-serif;
    }
    .menu-container {
      display: flex;
      flex-direction: column;
      align-items: center; 
  
    }
  
  </style>
  
