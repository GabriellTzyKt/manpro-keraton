<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';
    import { page } from '$app/stores';
  
    
    export let page2 = "Detail Situs";
    export let user = "Sri Apriliani";
    export let Manajemen = "Situs";
  
    let site = {
      name: "Pesanggrahan Langenharjo Sukoharjo",
      founder: "Pendiri Situs",
      yearFounded: "1850",
      address: "Kota Sukoharjo, Jawa Tengah",
      keyHolder: "Juru Kunci",
      siteType: "Wisata Sejarah",
      openingTime: "08:00",
      closingTime: "17:00",
      email: "pesanggrahan@gmail.com",
      phone: "123456789",
      ownership: "Kraton Solo",
      description: "Pesanggrahan Langenharjo merupakan salah satu situs bersejarah di Sukoharjo yang sering dikunjungi wisatawan...",
    };
    $: if ($page.url.searchParams) {
        // Update the site details if data is passed via URL query parameters
        site.name = $page.url.searchParams.get('name') || site.name;
        site.founder = $page.url.searchParams.get('founder') || site.founder;
        site.yearFounded = $page.url.searchParams.get('yearFounded') || site.yearFounded;
        site.keyHolder = $page.url.searchParams.get('keyHolder') || site.keyHolder;
        site.siteType = $page.url.searchParams.get('siteType') || site.siteType;
        site.openingTime = $page.url.searchParams.get('openingTime') || site.openingTime;
        site.closingTime = $page.url.searchParams.get('closingTime') || site.closingTime;
        site.email = $page.url.searchParams.get('email') || site.email;
        site.phone = $page.url.searchParams.get('phone') || site.phone;
        site.ownership = $page.url.searchParams.get('ownership') || site.ownership;
        site.description = $page.url.searchParams.get('description') || site.description;
    }
  
      const menuItems = [
      { name: "Dashboard", href: "/MS/dashboard" },
      {
        name: "Situs",
        dropdown: true,
        subItems: [
          { name: "Detail Situs", href: "/MS/situs/detailS" },
          { name: "Daftar Komunitas", href: "/MS/situs/daftarK" },
          { name: "Daftar Acara", href: "/MS/situs/daftarA" },
          { name: "Buku Tamu", href: "/MS/situs/BukuT" }
        ]
      },
    ];
  
      const toggleDropdown = (index) => {
          menuItems[index].isOpen = !menuItems[index].isOpen;
      };
  </script>
  
  <main class="layout">
    <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
    <div class="content">
        <Navbar {user} {page2} />
        <div class="site-detail">
            <div class="profile-section">
                <div class="profile-icon">
                    <img src="/src/lib/images/profileicon.svg" alt="situs"> 
                </div>
            </div>
            <a href="/MS/situs/detailS/ubah" class="edit-button">Ubah Situs</a>
            <div class="details-section">
                <div class="detail-item">
                    <p class="label">Nama Situs</p>
                    <p class="value">{site.name}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Dibangun oleh</p>
                    <p class="value">{site.founder}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Tahun Berdiri</p>
                    <p class="value">{site.yearFounded}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Alamat</p>
                    <p class="value">{site.address}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Juru Kunci</p>
                    <p class="value">{site.keyHolder}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Jenis Situs</p>
                    <p class="value">{site.siteType}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Jam Buka</p>
                    <p class="value">{site.openingTime}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Jam Tutup</p>
                    <p class="value">{site.closingTime}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Email</p>
                    <p class="value">{site.email}</p>
                </div>
                <div class="detail-item">
                    <p class="label">No Telepon</p>
                    <p class="value">{site.phone}</p>
                </div>
                <div class="detail-item">
                    <p class="label">Kepemilikan</p>
                    <p class="value">{site.ownership}</p>
                </div>
                <div class="detail-item description">
                    <p class="label">Deskripsi Situs</p>
                    <p class="value">{site.description}</p>
                </div>
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
        padding: 20px;
        background-color: #f8f9fa;
        margin-left: 250px;
    }
  
    .site-detail {
        background: #ffffff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 96.25%;
        text-align: left;
    }
  
    .profile-section {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 30px;
        margin-bottom: 30px;
    }
  
    .profile-icon img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
    }
  
    .edit-button {
        background-color: #FFC107;
        color: black;
        border: none;
        padding: 10px 60px;
        border-radius: 5px;
        text-decoration: none;
        cursor: pointer;
    }
  
    .details-section {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(500px, 1fr));
        gap: 20px;
        margin-top: 20px;
    }
  
    .detail-item {
        background: #f0f0f0;
        padding: 5px;
        border-radius: 8px;
    }
  
    .label {
        font-weight: bold;
        margin-bottom: 5px;
    }
  
    .value {
        margin-top: 5px;
        color: #333;
    }
  
  </style>