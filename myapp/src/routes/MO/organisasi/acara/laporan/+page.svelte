<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';
    
    export let page = "Detail Acara Organisasi";
    export let user = "Sri Apriliani";
    export let Manajemen = "Organisasi";
    let isDropdownOpen = false;

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
    let documentationImages = [
      "/src/lib/images/image1.svg",
      "/src/lib/images/image2.svg",
      "/src/lib/images/image3.svg",
      "/src/lib/images/image4.svg"

  ];
  const deleteImage = (index) => {
      documentationImages.splice(index, 1);
  };

  let jumlahHadir = 100;
  let perkiraanHadir = 200;
  let buktiFoto;
  let totalBiaya = 1000000;
  let pengeluaran = [
    { deskripsi: '', jumlah: 0 },
    { deskripsi: '', jumlah: 0 },
    { deskripsi: '', jumlah: 0 },
    { deskripsi: '', jumlah: 0 },
    { deskripsi: '', jumlah: 0 },
  ];

  function tambahPengeluaran() {
    pengeluaran = [...pengeluaran, { deskripsi: '', jumlah: 0 }];
  }

  function handleFileUpload(event) {
    const file = event.target.files[0];
    buktiFoto = file;
  }

  function updateTotalBiaya() {
    totalBiaya = pengeluaran.reduce((total, item) => total + Number(item.jumlah), 0);
  }
</script>

<main class="layout">
    <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
    <div class="content">
        <Navbar {user} {page} />
        <div class="event-detail">
            <div class="event-info">
                <h2>Informasi Acara</h2>
                <div class="edit-button"><button onclick="window.location.href='/MO/organisasi/acara/ubah'">Ubah</button></div>
                <div class="info-grid">
                    <div><strong>Nama Acara</strong><p>nama acara</p></div>
                    <div><strong>Jenis Acara</strong><p>Terbuka</p></div>
                    <div><strong>Kapasitas Acara</strong><p>100</p></div>
                    <div><strong>Penanggung Jawab</strong><p>penanggung jawab acara</p></div>
                    <div><strong>Tanggal Mulai</strong><p>tanggal mulai</p></div>
                    <div><strong>Tanggal Selesai</strong><p>tanggal selesai</p></div>
                    <div><strong>Lokasi Acara</strong><p>lokasi acara</p></div>
                    <div><strong>Jam Mulai</strong><p>xx.xx</p></div>
                    <div><strong>Jam Selesai</strong><p>xx.xx</p></div>
                    <div><strong>Tujuan Acara</strong><p>tujuan acara</p></div>
                    <div class="full-width"><strong>Deskripsi Acara</strong><p>deskripsi acara</p></div>
                    
                </div>
            </div>
            <hr class="styled-line">
            <div class="guest-list">
                <h2>Daftar Undangan</h2>
                <ul>
                    <li><span>Tn.</span> Nicholas Kenneth Prasetya <span>081357474986</span></li>
                    <li><span>Tn.</span> Nicholas Kenneth Prasetya <span>081357474986</span></li>
                    <li><span>Tn.</span> Nicholas Kenneth Prasetya <span>081357474986</span></li>
                    <li><span>Tn.</span> Nicholas Kenneth Prasetya <span>081357474986</span></li>
                    <li><span>Tn.</span> Nicholas Kenneth Prasetya <span>081357474986</span></li>
                    <li><span>Tn.</span> Nicholas Kenneth Prasetya <span>081357474986</span></li>
                </ul>
            </div>
            <hr class="styled-line">
            <h2>Laporan</h2>
            <div class="container">
                <div class="box">
                  <h3>Peserta</h3>
                  <div class="input-group">
                    <label>Jumlah Orang Hadir</label>
                    <input type="number" bind:value={jumlahHadir} />
                  </div>
                  <div class="input-group">
                    <label>Perkiraan Jumlah Orang Hadir</label>
                    <input type="number" bind:value={perkiraanHadir} />
                  </div>
                  <div class="input-group">
                    <label>Bukti Foto</label>
                    <input type="file" on:change={handleFileUpload} />
                  </div>
                </div>
              
                <!-- RAB Section -->
                <div class="box">
                  <h3>RAB</h3>
                  <p>Total Biaya: Rp {totalBiaya.toLocaleString()}</p>
                  <div class="expenses">
                    {#each pengeluaran as item, index}
                      <div>
                        <input
                          type="text"
                          placeholder="Keterangan Pengeluaran"
                          bind:value={item.deskripsi}
                        />
                        <input
                          type="number"
                          placeholder="Jumlah Uang"
                          bind:value={item.jumlah}
                          on:input={updateTotalBiaya}
                        />
                      </div>
                    {/each}
                  </div>
                  <button on:click={tambahPengeluaran}>Tambah</button>
                </div>
              </div>
              <hr class="styled-line">
            <div class="documentation-section">
                <h2>Dokumentasi Acara</h2>
                <div class="image-container">
                    {#each documentationImages as image, index}
                        <div class="image-item">
                            <img src={image} alt="Documentation" />
                            <button class="delete-button" on:click={() => deleteImage(index)}>🗑️</button>
                        </div>
                    {/each}
                </div>
                <button class="add-image-button">Tambah Gambar</button>
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
        padding: 20px;
    }
    .styled-line {
        border: none;
        height: 2px;
        background-color: #000000; /* Line color */
  
    }

    .event-detail {
        font-family: sans-serif;
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 20px;
        background-color: #f9f9f9;
    }

    .event-info, .guest-list {
        margin-bottom: 20px;
    }

    .info-grid {
        display: grid;
        font-family: sans-serif;
        grid-template-columns: repeat(3, 1fr);
        gap: 16px;
    }

    .info-grid div {
        background-color: white;
        padding: 10px;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .info-grid .full-width {
        grid-column: span 3;
    }

    .edit-button {
        grid-column: 3 / span 1;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        padding: 15px;
    }

    .edit-button button {
        font-family: sans-serif;
        background-color: #ffcc00;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        width: 150px;
    }

    .guest-list ul {
        list-style: none;
        padding: 0;
    }

    .guest-list li {
        display: flex;
        justify-content: space-between;
        padding: 8px 12px;
        border-bottom: 1px solid #ccc;
        background-color: white;
        border-radius: 4px;
        margin-bottom: 8px;
    }

    h2 {
        margin-bottom: 16px;
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
  .container {
    display: flex;
    gap: 2rem;
  }
  .box {
    border: 1px solid #ccc;
    padding: 1rem;
    border-radius: 0.5rem;
  }
  .input-group {
    margin-bottom: 1rem;
  }
  .input-group label {
    display: block;
    margin-bottom: 0.5rem;
  }
  .expenses input {
    width: calc(50% - 1rem);
    margin-bottom: 0.5rem;
  }
  .expenses {
    display: flex;
    flex-direction: column;
  }
  button {
    margin-top: 1rem;
    padding: 0.5rem;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 0.25rem;
  }
</style>
