<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';

    export let page = "Daftar Acara Situs";
    export let user = "Sri Apriliani";
    export let Manajemen = "Situs";
    import aksiIcon from '/src/lib/images/aksi.svg';

    let isDropdownOpen = false;

    let searchQuery = "";
    let siteFilter = "";
    let itemsPerPage = 8;
    let currentPage = 1;
    const maxItemsPerPage = 14;

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
        function filteredItems() {
        let filtered = items.filter(item => {
        const matchesOrganization = !siteFilter || item.site === siteFilter;
        const matchesSearchQuery = !searchQuery || item.name.toLowerCase().includes(searchQuery.toLowerCase());
        return matchesOrganization && matchesSearchQuery;
    });


    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    return filtered.slice(startIndex, endIndex);
}

function totalFilteredItems() {
    return items.filter(item => {
        const matchesOrganization = !siteFilter || item.site === siteFilter;
        const matchesSearchQuery = !searchQuery || item.name.toLowerCase().includes(searchQuery.toLowerCase());
        return matchesOrganization && matchesSearchQuery;
    }).length;
}



    let items = [
        { id: 1, status: "Berlangsung" },
        { id: 2, status: "Disetujui" },
        { id: 3, status: "Pending" },
        { id: 4, status: "Ditolak" },
        { id: 5, status: "Selesai" },
        { id: 6, status: "Selesai" },
        { id: 7, status: "Selesai" },
        { id: 8, status: "Selesai" },
        { id: 9, status: "Selesai" },
        { id: 10, status: "Selesai" },
        { id: 11, status: "Selesai" },
        { id: 12, status: "Selesai" },
        { id: 13, status: "Selesai" },
        { id: 14, status: "Selesai" },
        { id: 15, status: "Selesai" },
        { id: 16, status: "Selesai" },
        { id: 17, status: "Selesai" },
        { id: 18, status: "Selesai" }

    ];

    function getStatusClass(status) {
        switch (status) {
            case "Berlangsung":
                return "status-berlangsung";
            case "Disetujui":
                return "status-disetujui";
            case "Pending":
                return "status-pending";
            case "Ditolak":
                return "status-ditolak";
            case "Selesai":
                return "status-selesai";
            default:
                return "";
        }
    }

    let showModal = false;
    let showConfirmModal = false; 
    let modalPosition = { top: 0, left: 0 };
    let showTambahAnggotaModal = false;

    const openTambahAnggotaModal = () => {
        showTambahAnggotaModal = true;
    };

    const closeTambahAnggotaModal = () => {
        showTambahAnggotaModal = false;
    };

    const openModal = (event) => {
        const buttonRect = event.target.getBoundingClientRect();
        modalPosition = {
            top: buttonRect.top + window.scrollY - buttonRect.height,
            left: buttonRect.left + window.scrollX,
        };
        showModal = true;
        setTimeout(() => {
            document.addEventListener('click', handleOutsideClick);
        }, 0);
    };

    const closeModal = () => {
        showModal = false;
        document.removeEventListener('click', handleOutsideClick);
    };

    const handleOutsideClick = (event) => {
        const modalElement = document.querySelector('.modal');
        if (modalElement && !modalElement.contains(event.target)) {
            closeModal();
        }
    };

    const openConfirmModal = () => {
        showModal = false;
        showConfirmModal = true;
    };

    const closeConfirmModal = () => {
        showConfirmModal = false;
        removeOutsideClickHandler(); 
    };

    const handleArchive = () => {
        closeConfirmModal(); 
    };

    const removeOutsideClickHandler = () => {
        document.removeEventListener('click', handleOutsideClick);
    };
</script>

<main class="layout">
    <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
    <div class="content">
        <Navbar {user} {page} />
        <div class="controls">
            <button class="add-button" onclick="window.location.href='/MS/situs/daftarA/buat'">+ Tambah Data</button>
            <div class="filters">
                <select bind:value={siteFilter} class="filter-dropdown">
                    <option value="">Cari Komunitas</option>
                    <option value="">Komunitas Tari</option>
                </select>
                <input type="text" bind:value={searchQuery} placeholder="Cari Anggota" class="search-box"/>
            </div>
            <div class="pagination-controls">
                <label>Show 
                    <input type="number" bind:value={itemsPerPage} min="1" max={Math.min(maxItemsPerPage, totalFilteredItems())} on:input={() => itemsPerPage = Math.min(itemsPerPage, maxItemsPerPage)} class="items-per-page" /> entries
                </label>
            </div>
        </div>

        <div class="menu-container">
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID Acara</th>
                        <th>Nama Acara</th>
                        <th>Tanggal Acara</th>
                        <th>Penyelenggara Acara</th>
                        <th>Jenis Acara</th>
                        <th>Kapasitas</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    {#each filteredItems() as item, index}
                    <tr>
                        <td>{(currentPage - 1) * itemsPerPage + index + 1}</td>
                        <td>ID Acara</td>
                        <td>Nama Acara</td>
                        <td>Tanggal Acara</td>
                        <td>Penyelenggara Acara</td>
                        <td>Jenis Acara</td>
                        <td>Kapasitas</td>
                        <td>
                            <span class={getStatusClass(item.status)}>{item.status}</span>
                        </td>
                        <td><button class="action-button" on:click={openModal}>
                            <img src={aksiIcon} alt="Aksi" class="aksi-icon" />
                        </button></td>
                    </tr>
                    {/each}
                </tbody>
                
            </table>
            <div class="pagination">
                <button on:click={() => currentPage = Math.max(currentPage - 1, 1)}>Previous</button>
                {#each Array(Math.ceil(totalFilteredItems() / itemsPerPage)).fill().map((_, i) => i + 1) as page}
                    <button class:active={page === currentPage} on:click={() => currentPage = page}>{page}</button>
                {/each}
                <button on:click={() => currentPage = Math.min(currentPage + 1, Math.ceil(totalFilteredItems() / itemsPerPage))}>Next</button>
            </div>
        </div>
    </div>
    {#if showModal || showConfirmModal || showTambahAnggotaModal}
        <div class="overlay"></div> <!-- Add the overlay here -->
    {/if}

    {#if showModal}
        <div class="modal" style="top: {modalPosition.top}px; left: {modalPosition.left}px;">
            <div class="modal-content">
                <button class="modal-button" onclick="window.location.href='/MS/situs/daftarA/detail'">Detail Acara</button>
            </div>
        </div>
    {/if}

    {#if showConfirmModal}
        <div class="confirm-modal">
            <div class="confirm-modal-content">
                <p>Apakah anda ingin mengarsip anggota?</p>
                <div class="warning-icon">!</div> <!-- Warning icon -->
                <div class="button-group">
                    <button class="confirm-button confirm-yes" on:click={handleArchive}>Ya</button>
                    <button class="confirm-button confirm-no" on:click={closeConfirmModal}>Tidak</button>
                </div>
            </div>
        </div>
    {/if}
    {#if showTambahAnggotaModal}
        <!-- Modal for "Tambah Anggota" -->
        <div class="tambah-modal">
            <div class="tambah-modal-content">
                <h3>Tambah Anggota</h3>
                <label for="namaAnggota">Nama Anggota</label>
                <input type="text" id="namaAnggota" placeholder="Masukkan nama anggota" class="inputTambah" />

                <label for="jabatan">Pilih Jabatan</label>
                <select id="jabatan" class="inputTambah">
                    <option value="Anggota">Anggota</option>
                    <option value="Ketua">Ketua</option>
                    <option value="Sekretaris">Sekretaris</option>
                </select>

                <label for="deskripsi" >Deskripsi Tugas</label>
                <textarea id="deskripsi" placeholder="Masukkan deskripsi tugas" class="inputTambah"></textarea>

                <div class="modal-buttons">
                    <button on:click={closeTambahAnggotaModal} class="cancel-button">Batal</button>
                    <button class="save-button">Simpan</button>
                </div>
            </div>
        </div>
    {/if}
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

    .controls {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
    }

    .add-button {
        background-color: #004DA3;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }

    .filters {
        display: flex;
        gap: 10px;
        margin-left: auto; /* Push filters to the right */
        padding: 10px;
    }

    .filter-dropdown, .search-box {
        padding: 8px;
        border: 1px solid #ced4da;
        border-radius: 4px;
    }

    .items-per-page {
        width: 50px;
        margin-left: 5px;
    }

    .menu-container {
        margin-top: 10px;
        overflow-x: auto;
    }

    .styled-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .styled-table th {
        background-color: #89DCF0; /* Match table header color */
        color: black;
        font-weight: bold;
        font-family: sans-serif;
        text-align: left;
        padding: 12px;
    }

    .styled-table td {
        border-bottom: 1px solid #dee2e6;
        font-family: sans-serif;
        padding: 12px;
    }

    .styled-table tr:hover {
        background-color: #f1f3f5;
    }

    .status-berlangsung {
        background-color: #0093FF;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
    }
    
    .status-disetujui {
        background-color: #C1D800;
        color: black;
        padding: 5px 10px;
        border-radius: 5px;
    }
    
    .status-pending {
        background-color: #FFD700;
        color: black;
        padding: 5px 10px;
        border-radius: 5px;
    }
    
    .status-ditolak {
        background-color: #FF4343;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
    }
    
    .status-selesai {
        background-color: #C0C0C0;
        color: black;
        padding: 5px 10px;
        border-radius: 5px;
    }
    .action-button{
        color: white;
        background-color: white;
        border-color: white;
        box-shadow: none;
    }

    .pagination {
        display: flex;
        justify-content: center;
        padding: 20px;
        gap: 5px;
    }

    .pagination button {
        border: 1px solid #ced4da;
        padding: 8px 12px;
        border-radius: 4px;
        background-color: white;
        cursor: pointer;
    }

    .pagination button.active {
        background-color: #004DA3; /* Match active page color to table */
        color: white;
    }

    .modal {
    position: absolute;
    z-index: 1000;
    background-color: white;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    width: 100px;
    display: flex;
    flex-direction: column;
    align-items: center;
    }


    .modal-content {
        display: flex;
        flex-direction: column;
        gap: 5px;
        width: 100%;
    }

    .modal-button {
        background-color: white;
        border-color: white;

    }

    .confirm-modal {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1000;
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        text-align: center;
        width: 300px;
    }

    .confirm-modal-content {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .warning-icon {
        font-size: 50px;
        color: #808080;
        margin: 20px 0;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 50px;
        height: 50px;
        border: 2px solid #808080;
        border-radius: 50%;
    }

    .button-group {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }

    .confirm-button {
        padding: 10px;
        width: 45%;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .confirm-yes {
        background-color: #FF0000;
        color: white;
    }

    .confirm-no {
        background-color: #B0B0B0;
        color: white;
    }

    .confirm-button:hover {
        opacity: 0.8;
    }
    .tambah-modal {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1000;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        width: 800px;
    }

    .tambah-modal-content {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    .inputTambah{
        padding: 15px;
    }

    .modal-buttons {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }

    .cancel-button, .save-button {
        padding: 8px 12px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .cancel-button {
        background-color: #b0b0b0;
        color: white;
    }

    .save-button {
        background-color: #004da3;
        color: white;
    }

    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
        z-index: 999; /* Ensures it sits behind the modal but above the content */
    }

</style>

