<script>
    export let namaOrganisasi = '';
    export let tanggalBergabung = '';
    export let peran = '';
    export let jumlahAnggota = ''; // Biarkan sebagai string
</script>

<div class="riwayat-container">
    <div class="riwayat-header">
        <h3>{namaOrganisasi}</h3>
    </div>
    <div class="riwayat-body">
        <p><strong>Tanggal Bergabung:</strong> {tanggalBergabung}</p>
        <p><strong>Sebagai:</strong> {peran}</p>
        <p><strong>Jumlah Anggota:</strong> {jumlahAnggota} orang</p>
    </div>
</div>

<style>
    .riwayat-container {
        border-radius: 12px;
        background-color: #f0f4ff;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        padding: 16px;
        margin-bottom: 16px;
        font-family: 'Poppins', sans-serif;
    }

    .riwayat-header {
        background-color: #629ada;
        color: white;
        padding: 8px;
        border-radius: 8px 8px 0 0;
        font-weight: bold;
    }

    .riwayat-body {
        background-color: white;
        padding: 8px;
        border-radius: 0 0 8px 8px;
        color: #333;
    }

    p {
        margin: 4px 0;
        line-height: 1.6;
    }
</style>
