<script>
    let fullName = '';
    let phone = '';
    let gender = 'Laki-laki';
    let birthPlace = '';
    let birthDate = '';
    let address = '';
    let email = '';

    function submitFullRegistration() {
        console.log('Full Name:', fullName);
        console.log('Phone:', phone);
        console.log('Gender:', gender);
        console.log('Birth Place:', birthPlace);
        console.log('Birth Date:', birthDate);
        console.log('Address:', address);
        console.log('Email:', email);
        // Logic for full registration
    }
</script>

<div class="register-form">
    <h3>Daftar</h3>
    <form on:submit|preventDefault={submitFullRegistration} class="flex flex-col justify-between h-full">
        <div>
            <input type="text" placeholder="Nama Lengkap" bind:value={fullName} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
            <input type="text" placeholder="No HP" bind:value={phone} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
            <select bind:value={gender} class="w-full p-2 mb-4 border rounded-md border-gray-300">
                <option value="Laki-laki">Laki-laki</option>
                <option value="Perempuan">Perempuan</option>
            </select>
            <input type="text" placeholder="Tempat Lahir" bind:value={birthPlace} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
            <input type="date" placeholder="Tanggal Lahir" bind:value={birthDate} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
            <input type="text" placeholder="Alamat" bind:value={address} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
            <input type="email" placeholder="Email" bind:value={email} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
        </div>
        <button type="submit" class="w-full py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition duration-300">Daftar</button>
    </form>
</div>

<style>
    .register-form {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 1000px; /* Lebar form */
        height: 708px; /* Tinggi form */
        margin: 0 auto; /* Center secara horizontal */
        display: flex;
        flex-direction: column;
        justify-content: space-between; /* Pastikan elemen di bagian atas dan bawah */
    }

    .register-form h3 {
        margin-bottom: 1.5rem;
        font-family: sans-serif;
        color: #333;
        font-size: 36px;
        font-weight: bolder;
    }


    .register-form input {
        width: 100%;
        padding: 0.75rem;
        margin-bottom: 1rem;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
        border-color: #0B2E4B;
    }

    .register-form button {
        width: 100%;
        padding: 0.75rem;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        cursor: pointer;
    }

    .register-form button:hover {
        background-color: #0056b3;
    }
/* 
    .register-form p {
        margin-top: 1rem;
    }

    .register-form a {
        color: #007bff;
        text-decoration: none;
    }

    .register-form a:hover {
        text-decoration: underline;
    } */
</style>