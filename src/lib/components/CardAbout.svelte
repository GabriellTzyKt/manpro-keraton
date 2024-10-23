<script>
    export let content;
    export let imageSrc;
    export let bgColor = '#AC9794'; // Default warna background
</script>

<div class="card" style="background-color: {bgColor};">
    <img src={imageSrc} class="card-img" />
    <p class="card-content">{content}</p>
</div>

<style>
    .card {
        width: 372px;
        height: 440px;
        border-radius: 20px;
        padding: 24px 35px; /* Padding sesuai dengan gambar referensi */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        font-family: 'Poppins', sans-serif;
        display: flex;
        flex-direction: column;
        justify-content: flex-start; /* Agar konten dimulai dari atas */
        align-items: center;
    }

    .card-img {
        width: 302px;
        height: 178px;
        border-radius: 20px;
        object-fit: cover;
        margin-bottom: 24px; /* Jarak antara gambar dan teks */
        border-color: #ffff;
        border-width: 0.5px;
    }

    .card-content {
        font-size: 12px;
        color: #0b2e4b;
        text-align: justify;
    }
</style>
