<script>
    import Sidebar from '/src/lib/component/sidebar.svelte';
    import Navbar from '/src/lib/component/navbar.svelte';
    
    export let page = "Buat Acara Situs";
    export let user = "Sri Apriliani";
    export let Manajemen = "Situs";
    let isDropdownOpen = false;

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
    const submitForm = () => {
        console.log('Form Submitted:', organization);
        // You can implement form submission logic here, such as sending data to a server or API.
        alert('Form Submitted Successfully');
    };
    let isNew = true;

    function toggleEventType(type) {
        isNew = (type === 'new');
    }
    let invitations = [
        { title: "Tn.", name: "", phone: "" }
    ];

    const addInvitation = () => {
    invitations = [...invitations, { title: "Tn.", name: "", phone: "" }];
    };


    const deleteInvitation = (index) => {
        invitations = invitations.filter((_, i) => i !== index);
    };

    const updateInvitation = (index, field, value) => {
        invitations[index] = { ...invitations[index], [field]: value };
    };
</script>

<main class="layout">
    <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
    <div class="content">
        <Navbar {user} {page} />
        <div class="event-edit">
            <div class="toggle-buttons">
                <button 
                    class:is-active={isNew}
                    on:click={() => toggleEventType('new')}>
                    Baru
                </button>
                <button 
                    class:is-active={!isNew}
                    on:click={() => toggleEventType('old')}>
                    Lama
                </button>
            </div>
            
            {#if isNew}
                <!-- Display New Event Form -->
                <div class="new-event-form">
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
                            <button type="submit" class="save-button" onclick="window.location.href='/MS/situs/daftarA'">Simpan Data</button>
                        </div>
                    </form>
                    <hr class="styled-line">
                    <div class="invitation-section">
                        <h3>Undangan</h3>
                        <div class="invitation-list">
                          {#each invitations as invitation, index}
                            <div class="invitation-item">
                              <select bind:value={invitation.title} on:change={(e) => updateInvitation(index, 'title', e.target.value)}>
                                <option>Tn.</option>
                                <option>Nn.</option>
                              </select>
                              <input type="text" placeholder="Nama Lengkap" bind:value={invitation.name} on:input={(e) => updateInvitation(index, 'name', e.target.value)} />
                              <input type="text" placeholder="Nomor Telepon" bind:value={invitation.phone} on:input={(e) => updateInvitation(index, 'phone', e.target.value)} />
                              <button class="delete-button" type="button" on:click={() => deleteInvitation(index)}>🗑️</button>
                            </div>
                          {/each}
                          <button class="add-invitation" type="button" on:click={addInvitation}>Tambah Undangan</button>
                        </div>
                      </div>
                </div>
            {:else}
                <!-- Display Old Event Form -->
                <div class="old-event-form">
                    <p>Form for old event goes here</p>
                </div>
            {/if}
            
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
    .toggle-buttons {
        display: flex;
        border: 2px solid blue;
        border-radius: 25px;
        overflow: hidden;
        width: 300px;
    }

    .toggle-buttons button {
        flex: 1;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        outline: none;
        background-color: white;
        color: black;
        font-weight: bold;
        transition: background-color 0.3s, color 0.3s;
    }

    .toggle-buttons button.is-active {
        background-color: blue;
        color: white;
    }

    .toggle-buttons button:not(.is-active):hover {
        background-color: #e0e0e0;
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
        margin-top: 30px;
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
