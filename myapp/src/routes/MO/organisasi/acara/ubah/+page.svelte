<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';
    
    export let page = "Edit Acara Organisasi";
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
    const submitForm = () => {
        console.log('Form Submitted:', organization);
        // You can implement form submission logic here, such as sending data to a server or API.
        alert('Form Submitted Successfully');
    };
</script>

<main class="layout">
    <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
    <div class="content">
        <Navbar {user} {page} />
        <div class="event-edit">
            <form class="event-form" on:submit|preventDefault={submitForm}>
                <div class="form-group">
                    <label>Nama Acara</label>
                    <input type="text" placeholder="John Doe" />
                </div>
                <div class="form-group">
                    <label>Kapasitas Acara</label>
                    <input type="number" placeholder="100" />
                </div>
                <div class="form-group">
                    <label>Jenis Acara</label>
                    <div class="radio-group">
                        <input type="radio" id="private" name="jenisAcara" value="Private" />
                        <label for="private">Privat</label>
                        <input type="radio" id="public" name="jenisAcara" value="Public" />
                        <label for="public">Publik</label>
                    </div>
                </div>
                <div class="form-group">
                    <label>Lokasi Acara</label>
                    <input type="text" placeholder="Lokasi Acara" />
                </div>
                <div class="form-group">
                    <label>Penanggung Jawab</label>
                    <input type="text" placeholder="John Doe" />
                </div>
                <div class="form-group">
                    <label>Tanggal Mulai</label>
                    <input type="date" placeholder="DD-MM-YYYY" />
                </div>
                <div class="form-group">
                    <label>Tanggal Selesai</label>
                    <input type="date" placeholder="DD-MM-YYYY" />
                </div>
                <div class="form-group">
                    <label>Waktu Mulai</label>
                    <input type="time" placeholder="XX:XX" />
                </div>
                <div class="form-group">
                    <label>Waktu Selesai</label>
                    <input type="time" placeholder="XX:XX" />
                </div>
                <div class="form-group full-width">
                    <label>Tujuan Acara</label>
                    <input type="text" placeholder="Tujuan Acara" />
                </div>
                <div class="form-group full-width">
                    <label>Deskripsi Acara</label>
                    <textarea placeholder="Deskripsi Acara"></textarea>
                </div>
                <div class="submit-button">
                    <button type="submit" class="save-button" onclick="window.location.href='/MO/organisasi/acara/detail'">Simpan Data</button>
                </div>
            </form>
            <hr class="styled-line">
            <div class="invitation-section">
                <h3>Undangan</h3>
                <div class="invitation-list">
                    <div class="invitation-item">
                        <select>
                            <option>Tn.</option>
                            <option>Nn.</option>
                        </select>
                        <input type="text" placeholder="Nama Lengkap" />
                        <input type="text" placeholder="Nomor Telepon" />
                        <button class="delete-button">🗑️</button>
                    </div>
                    <!-- Additional invitation items can be duplicated here -->
                    <button class="add-invitation">Tambah Undangan</button>
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

    .event-edit {
        background-color: #f9f9f9;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
    }

    .event-form {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 16px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
    }

    .form-group.full-width {
        grid-column: span 2;
    }

    label {
        margin-bottom: 8px;
        font-weight: bold;
    }

    input, textarea {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .radio-group {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .save-button {
        background-color: #28a745;
        border: none;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    .invitation-section {
        margin-top: 20px;
    }

    .invitation-list {
        display: flex;
        flex-direction: column;
    }

    .invitation-item {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 10px;
    }

    .delete-button {
        background: none;
        border: none;
        cursor: pointer;
        color: red;
    }

    .add-invitation {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
    }

    h3 {
        margin-bottom: 16px;
    }
</style>
