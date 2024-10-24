<script>
  import Sidebar from '/src/lib/component/sidebar.svelte';
  import Navbar from '/src/lib/component/navbar.svelte';
  import { page } from '$app/stores';

  
  export let page2 = "Detail Organisasi";
  export let user = "Sri Apriliani";
  export let Manajemen = "Organisasi";

  let organization = {
    name: "Lembaga Dewan Adat Keraton Surakarta",
    responsiblePerson: "Yulia Budiwati Widyaningrum, M.Si.",
    address: "Kota Surakarta, Jawa Tengah",
    advisor: "pembina",
    protector: "pelindung",
    email: "lembagadewanadat@gmail.com",
    phone: "123456789",
    memberCount: 100,
    description: "Dewan Adat Keraton Surakarta adalah lembaga tradisional yang bertugas menjaga dan melestarikan nilai-nilai budaya..."
  };

    $: if ($page.url.searchParams) {
        // Update the organization details if data is passed via URL query parameters
        organization.name = $page.url.searchParams.get('name') || organization.name;
        organization.address = $page.url.searchParams.get('address') || organization.address;
        organization.email = $page.url.searchParams.get('email') || organization.email;
        organization.phone = $page.url.searchParams.get('phone') || organization.phone;
        organization.memberCount = $page.url.searchParams.get('memberCount') || organization.memberCount;
        organization.description = $page.url.searchParams.get('description') || organization.description;
    }
  let documentationImages = [
      "/src/lib/images/image1.svg",
      "/src/lib/images/image2.svg",
      "/src/lib/images/image3.svg",
      "/src/lib/images/image4.svg"

  ];

  const deleteImage = (index) => {
    documentationImages = documentationImages.filter((_, i) => i !== index);
  };
  const handleAddImage = (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = () => {
        const img = new Image();
        img.src = reader.result;
        img.onload = () => {
          const canvas = document.createElement('canvas');
          const ctx = canvas.getContext('2d');
          const width = 253; // Desired width
          const height = 160; // Desired height
          canvas.width = width;
          canvas.height = height;
          ctx.drawImage(img, 0, 0, width, height);
          const resizedImage = canvas.toDataURL('image/jpeg'); // Convert the canvas content to a data URL
          documentationImages = [...documentationImages, resizedImage];
        };
      };
      reader.readAsDataURL(file);
    }
  };

  const menuItems = [
        { name: "Dashboard", href: "/MO/dashboard" },
        {
            name: "Organisasi",
            dropdown: true,
            subItems: [
                { name: "Detail Organisasi", href: "/MO/organisasi/detailO" },
                { name: "Daftar Anggota", href: "/MO/organisasi/daftarA" },
                { name: "Acara", href: "/MO/organisasi/acara" }
            ]
        }
    ];

    const toggleDropdown = (index) => {
        menuItems[index].isOpen = !menuItems[index].isOpen;
    };
</script>

<main class="layout">
    <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
    <div class="content">
      <Navbar {user} {page2} />
      <div class="organization-detail">
        <div class="profile-section">
          <div class="profile-icon">
            <img src="/src/lib/images/profileicon.svg" alt="organisasi"> 
          </div>
        </div>
        <a href="/MO/organisasi/detailO/ubah" class="edit-button">Ubah</a>
        <div class="details-section">
          <div class="detail-item">
            <p class="label">Nama Organisasi</p>
            <p class="value">{organization.name}</p>
          </div>
          <div class="detail-item">
            <p class="label">Penanggung Jawab</p>
            <p class="value">{organization.responsiblePerson}</p>
          </div>
          <div class="detail-item">
            <p class="label">Alamat</p>
            <p class="value">{organization.address}</p>
          </div>
          <div class="detail-item">
            <p class="label">Pembina</p>
            <p class="value">{organization.advisor}</p>
          </div>
          <div class="detail-item">
            <p class="label">Pelindung</p>
            <p class="value">{organization.protector}</p>
          </div>
          <div class="detail-item">
            <p class="label">Email</p>
            <p class="value">{organization.email}</p>
          </div>
          <div class="detail-item">
            <p class="label">No Telepon</p>
            <p class="value">{organization.phone}</p>
          </div>
          <div class="detail-item">
            <p class="label">Jumlah Anggota</p>
            <p class="value">{organization.memberCount}</p>
          </div>
          <div class="detail-item description">
            <p class="label">Deskripsi Organisasi</p>
            <p class="value">{organization.description}</p>
          </div>
        </div>
        <div class="documentation-section">
          <h3>Dokumentasi</h3>
          <div class="image-container">
            {#each documentationImages as image, index}
              <div class="image-item">
                <img src={image} alt="Documentation" />
                <button class="delete-button" on:click={() => deleteImage(index)}>🗑️</button>
              </div>
            {/each}
          </div>
          <input type="file" accept="image/*" on:change={handleAddImage} class="add-image-input" />
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

  .organization-detail {
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

  .documentation-section {
      margin-top: 30px;
  }

  .image-container {
      display: flex;
      overflow-x: auto;
      gap: 10px;
      margin-top: 10px;
  }

  .image-item {
      position: relative;
  }

  .delete-button {
      position: absolute;
      top: 5px;
      right: 5px;
      background: transparent;
      border: none;
      cursor: pointer;
      font-size: 16px;
      color: red;
  }

  .add-image-button {
      background-color: #007BFF;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      margin-top: 15px;
      cursor: pointer; 
  }
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

  .organization-detail {
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

  .documentation-section {
    margin-top: 30px;
  }

  .image-container {
    display: flex;
    overflow-x: auto;
    gap: 10px;
    margin-top: 10px;
  }

  .image-item {
    position: relative;
  }

  .delete-button {
    position: absolute;
    top: 5px;
    right: 5px;
    background: transparent;
    border: none;
    cursor: pointer;
    font-size: 16px;
    color: red;
  }

  .add-image-input {
    margin-top: 15px;
    cursor: pointer;
  }
</style>