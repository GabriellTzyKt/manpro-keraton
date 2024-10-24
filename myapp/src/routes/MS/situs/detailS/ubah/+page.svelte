<script>
  import Sidebar from '/src/lib/component/sidebar.svelte';
  import Navbar from '/src/lib/component/navbar.svelte';

  export let page2 = "Ubah Situs";
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
    wisata: "wisata"
  };

  let profileImage = "/src/lib/images/profileicon.svg";

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

  const submitForm = () => {
      const query = new URLSearchParams({
        name: site.name,
        founder: site.founder,
        yearFounded: site.yearFounded,
        address: site.address,
        keyHolder: site.keyHolder,
        siteType: site.siteType,
        openingTime: site.openingTime,
        closingTime: site.closingTime,
        email: site.email,
        phone: site.phone,
        ownership: site.ownership,
        description: site.description,
        wisata: site.wisata
      }).toString();
  
      window.location.href = `/MS/situs/detailS?${query}`;
  };
  
  const toggleDropdown = (index) => {
      menuItems[index].isOpen = !menuItems[index].isOpen;
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
</script>

<main class="layout">
  <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
  <div class="content">
      <Navbar {user} {page2} />
      <div class="edit-site">
          <div class="profile-icon">
              <img src={profileImage} alt="situs">
              <input type="file" class="upload" on:change={handleFileUpload} />
          </div>
          <form on:submit|preventDefault={submitForm}>
              <div class="grid-container">
                  <div class="grid-item">
                      <label for="site-name">Nama Situs</label>
                      <input type="text" id="site-name" bind:value={site.name} />
                  </div>
                  <div class="grid-item">
                      <label for="email">Email</label>
                      <input type="email" id="email" bind:value={site.email} />
                  </div>
                  <div class="grid-item">
                      <label for="phone">No Telepon</label>
                      <input type="text" id="phone" bind:value={site.phone} />
                  </div>
                  <div class="grid-item">
                      <label for="ownership">Kepemilikan</label>
                      <input type="text" id="ownership" bind:value={site.ownership} />
                  </div>
                  <div class="grid-item">
                      <label for="description">Deskripsi Situs</label>
                      <textarea id="description" bind:value={site.description} rows="4"></textarea>
                  </div>
                  <div class="grid-item">
                      <label for="founder">Dibangun oleh</label>
                      <input type="text" id="founder" bind:value={site.founder} />
                  </div>
                  <div class="grid-item">
                      <label for="year">Tahun Berdiri</label>
                      <input type="text" id="year" bind:value={site.yearFounded} />
                  </div>
                  <div class="grid-item">
                      <label for="address">Alamat</label>
                      <input type="text" id="address" bind:value={site.address} />
                  </div>
                  <div class="grid-item">
                      <label for="keyHolder">Juru Kunci</label>
                      <input type="text" id="keyHolder" bind:value={site.keyHolder} />
                  </div>
                  <div class="grid-item">
                      <label for="siteType">Jenis Situs</label>
                      <select id="siteType" bind:value={site.siteType}>
                          <option value="petilasan">Petilasan</option>
                          <option value="makam">Makam</option>
                          <option value="pertapaan">Pertapaan</option>
                          <option value="pesanggrahan">Pesanggrahan</option>
                          <option value="candi">Candi</option>
                          <option value="wisata">Wisata</option>
                          <option value="ritual">Ritual</option>
                      </select>
                  </div>
                  <div class="grid-item">
                      <label for="openingTime">Jam Buka</label>
                      <input type="text" id="openingTime" bind:value={site.openingTime} />
                  </div>
                  <div class="grid-item">
                      <label for="closingTime">Jam Tutup</label>
                      <input type="text" id="closingTime" bind:value={site.closingTime} />
                  </div>
                  <div class="grid-item">
                      <label for="wisata">Wisata</label>
                      <input type="text" id="wisata" bind:value={site.wisata} />
                  </div>
              </div>
              <div class="button-container">
                  <button type="submit" class="save-button">Simpan Data</button>
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
  .profile-icon img {
      width: 80px;
      height: 80px;
      border-radius: 50%;
  }
  .upload {
      width: 210px;
  }
  .edit-site {
      background: #fff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      width: 96.25%;
  }
  form {
      display: flex;
      flex-direction: column;
  }
  .grid-container {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 20px;
      margin-top: 20px;
  }
  .grid-item {
      display: flex;
      flex-direction: column;
      gap: 10px;
      margin-right: 40px;
  }
  label {
      font-weight: bold;
      margin-bottom: 5px;
  }
  input,
  textarea,
  select {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1em;
      background: #f0f0f0;
      width: 100%;
  }
  textarea {
      resize: vertical;
  }
  .button-container {
      display: flex;
      justify-content: flex-end;
      margin-top: 20px;
  }
  .save-button {
      background-color: #28a745;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
  }
  .save-button:hover {
      background-color: #218838;
  }
</style>
