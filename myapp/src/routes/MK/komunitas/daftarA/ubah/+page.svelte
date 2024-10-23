<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';

    export let page = "Ubah Anggota";
    export let user = "Sri Apriliani";
    export let Manajemen = "Komunitas";

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
    const submitForm = () => {
        console.log('Form Submitted:', organization);
        alert('Form Submitted Successfully');
    };
</script>

<main class="layout">
    <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
    <div class="content">
        <Navbar {user} {page} />
        <div class="form-container">
            <form on:submit|preventDefault={submitForm}>
                <div class="form-group">
                    <label for="nama">Nama Lengkap / Asma Timur*</label>
                    <input id="nama" type="text" value="John Doe" />
                </div>

                <div class="form-group">
                    <label for="tempatLahir">Tempat Lahir*</label>
                    <input id="tempatLahir" type="text" value="Solo" />
                </div>

                <div class="form-group">
                    <label for="tanggalLahir">Tanggal Lahir*</label>
                    <input id="tanggalLahir" type="text" value="12-12-2004" />
                </div>

                <div class="form-group">
                    <label for="jenisKelamin">Jenis Kelamin*</label>
                    <input id="jenisKelamin" type="text" value="L/P" />
                </div>

                <div class="form-group">
                    <label for="alamat">Alamat*</label>
                    <input id="alamat" type="text" value="alamat" />
                </div>

                <div class="form-group">
                    <label for="noTelepon">No Telepon*</label>
                    <input id="noTelepon" type="text" value="xxxxxxxxxxx" />
                </div>

                <div class="form-group">
                    <div class="radio-group">
                        <label for="namaAyah">Nama Ayah</label>
                        <label>Ayah seorang abdi?</label>
                        <input type="radio" id="ayahIya" name="ayahAbdi" value="Iya" />
                        <label for="ayahIya">Iya</label>
                        <input type="radio" id="ayahTidak" name="ayahAbdi" value="Tidak" />
                        <label for="ayahTidak">Tidak</label>
                    </div>
                    <input id="namaAyah" type="text" placeholder="nama ayah" />
                </div>

                <div class="form-group">

                    <div class="radio-group">
                        <label for="namaIbu">Nama Ibu</label>
                        <label>Ibu seorang abdi?</label>
                        <input type="radio" id="ibuIya" name="ibuAbdi" value="Iya" />
                        <label for="ibuIya">Iya</label>
                        <input type="radio" id="ibuTidak" name="ibuAbdi" value="Tidak" />
                        <label for="ibuTidak">Tidak</label>
                    </div>
                    <input id="namaIbu" type="text" placeholder="nama ibu" />
                </div>

                <div class="form-group">
                    <label for="email">Email (opsional)</label>
                    <input id="email" type="email" placeholder="email" />
                </div>

                <div class="form-group">
                    <label for="wongso">Wongso</label>
                    <input id="wongso" type="text" value="jawa" />
                </div>

                <div class="form-group">
                    <label for="pekerjaan">Pekerjaan (opsional)</label>
                    <input id="pekerjaan" type="text" placeholder="pekerjaan" />
                </div>

                <div class="form-group">
                    <label for="hobi">Hobi (opsional)</label>
                    <input id="hobi" type="text" value="Bermain musik" />
                </div>

                <div class="form-group">
                    <label for="jabatan">Jabatan</label>
                    <input id="jabatan" type="text" value="Penanggung Jawab" />
                </div>

                <div class="form-group">
                    <label for="agama">Agama (opsional)</label>
                    <input id="agama" type="text" placeholder="agama" />
                </div>

                <div class="form-group">
                    <label for="deskripsi">Deskripsi Tugas</label>
                    <input id="deskripsi" type="text" value="Bertanggung Jawab atas komunitas" />
                </div>

                <div class="form-actions">
                    <button type="submit" onclick="window.location.href='/MK/komunitas/daftarA'">Simpan Data</button>
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

    .form-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    form {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        position: relative;
    }

    label {
        font-weight: bold;
        margin-bottom: 8px;
    }

    input[type="text"],
    input[type="email"] {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }

    .form-group .radio-group {
        display: flex;
        align-items: center;
        margin-top: 8px;
    }

    .radio-group label {
        margin-right: 10px;
        margin-left: 5px;
    }

    input[type="radio"] {
        margin-left: 10px;
    }

    .form-actions {
        grid-column: span 3;
        display: flex;
        justify-content: flex-end;
        margin-top: 20px;
    }

    button {
        padding: 10px 20px;
        background-color: #28a745;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover {
        background-color: #218838;
    }
</style>
