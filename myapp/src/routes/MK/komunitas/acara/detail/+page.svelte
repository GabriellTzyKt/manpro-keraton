<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';
    
    export let page = "Detail Acara Komunitas";
    export let user = "Sri Apriliani";
    export let Manajemen = "Komunitas";
    let isDropdownOpen = false;

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
        <div class="event-detail">
            <div class="event-info">
                <h2>Informasi Acara</h2>
                <div class="edit-button"><button onclick="window.location.href='/MK/komunitas/acara/ubah'">Ubah</button></div>
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
</style>
