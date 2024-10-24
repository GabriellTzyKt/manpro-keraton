<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';
    import { onMount } from 'svelte';
  
    export let page = "Ubah Detail Organisasi";
    export let user = "Sri Apriliani";
    export let Manajemen = "Organisasi";
    let profileImage = "/src/lib/images/profileicon.svg";
  
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

  
  const submitForm = () => {
    // Redirect to detail page with the updated data passed in the URL (or use a store to persist it).
    const query = new URLSearchParams({
      name: organization.name,
      address: organization.address,
      email: organization.email,
      phone: organization.phone,
      memberCount: organization.memberCount,
      description: organization.description
    }).toString();

    window.location.href = `/MO/organisasi/detailO?${query}`;
  };
  
    function handleFileUpload(event) {
      const file = event.target.files[0];
      if (file) {
          const reader = new FileReader();
          reader.onload = (e) => {
              profileImage = e.target.result;
          };
          reader.readAsDataURL(file);
      }
  }
  
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
      <Navbar {user} {page} />
      <div class="organization-detail">
        <div class="profile-section">
          <div class="profile-icon">
            <img src={profileImage} alt="organisasi">
              <input type="file" class="upload" on:change={handleFileUpload} />
          </div>
        </div>
  
        <!-- Form begins here -->
        <form on:submit|preventDefault={submitForm}>
          <div class="details-section">
            <div class="detail-item">
              <label class="label">Nama Organisasi</label>
              <input class="value" type="text" bind:value={organization.name} />
            </div>
            <div class="detail-item">
              <label class="label">Penanggung Jawab</label>
              <p class="value">{organization.responsiblePerson}</p>
            </div>
            <div class="detail-item">
              <label class="label">Alamat</label>
              <input class="value" type="text" bind:value={organization.address} />
            </div>
            <div class="detail-item">
              <label class="label">Pembina</label>
              <p class="value">{organization.advisor}</p>
            </div>
            <div class="detail-item">
              <label class="label">Pelindung</label>
              <p class="value">{organization.protector}</p>
            </div>
            <div class="detail-item">
              <label class="label">Email</label>
              <input class="value" type="email" bind:value={organization.email} />
            </div>
            <div class="detail-item">
              <label class="label">No Telepon</label>
              <input class="value" type="text" bind:value={organization.phone} />
            </div>
            <div class="detail-item">
              <label class="label">Jumlah Anggota</label>
              <input class="value" type="number" bind:value={organization.memberCount} />
            </div>
            <div class="detail-item description">
              <label class="label">Deskripsi Organisasi</label>
              <textarea class="value" rows="4" bind:value={organization.description}></textarea>
            </div>
          </div>
          
          <!-- Button container -->
          <div class="button-container">
            <button type="submit" class="submit-button">Simpan</button>
          </div>
        </form>
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
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        width: 97%;
    }

    .button-container {
        text-align: right;
        margin-top: 20px;
    }

    .submit-button {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .submit-button:hover {
        background-color: #218838;
    }
</style>
