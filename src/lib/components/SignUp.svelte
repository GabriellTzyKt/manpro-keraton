<!-- <script>
    let username = '';
    let password = '';
    let confirmPassword = '';

    function register() {
        console.log('Username:', username);
        console.log('Password:', password);
        console.log('Confirm Password:', confirmPassword);
    }
</script> -->

<script>
    import { navigate } from 'svelte-routing';
    let username = '';
    let password = '';
    let confirmPassword = '';

    function register() {
        if (password === confirmPassword) {
            console.log('Username:', username);
            console.log('Password:', password);
            navigate('/full-registration');  // Navigasi ke halaman pendaftaran lengkap
        } else {
            alert('Kata sandi dan konfirmasi kata sandi tidak cocok');
        }
    }
</script>


<div class="register-form">
    <img src="/logoKraton.png" alt="logoKraton">
    <h3>Daftar</h3>
    <form on:submit|preventDefault={register} class="flex flex-col justify-between h-full">
        <div class="flex-grow">
            <input type="text" placeholder="Username" bind:value={username} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
            <input type="password" placeholder="Kata Sandi" bind:value={password} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
            <input type="password" placeholder="Konfirmasi Kata Sandi" bind:value={confirmPassword} required class="w-full p-2 mb-4 border rounded-md border-gray-300">
        </div>
        <div>
            <button type="submit" class="w-full py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition duration-300 mb-4">Lanjut</button>
            <p>Sudah punya akun? <a href="/loginKraton" class="text-blue-600 hover:underline">Masuk</a></p>
        </div>
    </form>
</div>

<style>
    .register-form {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 500px; /* Lebar form */
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

    .register-form img {
        display: block;
        margin: 0 auto 1.5rem auto;
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

    .register-form p {
        margin-top: 1rem;
    }

    .register-form a {
        color: #007bff;
        text-decoration: none;
    }

    .register-form a:hover {
        text-decoration: underline;
    }
</style>
