<script lang="ts">
    //@ts-nocheck
    export let imageSrc;
    export let imageAlt = 'Situs Bersejarah'; // Default alt text
    export let title;
    export let content;
    export let href = ''; // URL untuk navigasi, default kosong
</script>

<!-- Card structure -->
<div class="card" role="link" tabindex="0" on:click={() => { if (href) window.location.href = href; }} on:keypress={(e) => { if ((e.key === 'Enter' || e.key === ' ') && href) window.location.href = href; }}>
    <img src={imageSrc} alt={imageAlt} class="card-img" />
    <div class="card-body">
        <h2 class="card-title">{title}</h2>
        <p class="card-content">{content}</p>
        <span class="card-link">Selanjutnya →</span>
    </div>
</div>

<!-- CSS -->
<style>
    .card {
        width: 340px;
        height: 440px;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        font-family: 'Poppins', sans-serif;
        display: flex;
        flex-direction: column;
        position: relative;
        cursor: pointer;
        transition: transform 0.3s ease;
    }

    .card:hover {
        transform: scale(1.05); /* Zoom efek saat di hover */
    }

    .card-img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
    }

    .card-body {
        padding: 20px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        flex-grow: 1;
        position: relative;
    }

    .card-title {
        font-size: 20px;
        font-weight: 600;
        color: #0b2e4b;
        margin-bottom: 4px;
    }

    .card-content {
        font-size: 12px;
        color: #0b2e4b;
        line-height: 1.5;
        text-align: justify;
        flex-grow: 1;
    }

    .card-link {
        font-size: 16px;
        color: #629a34;
        text-decoration: none;
        font-weight: bold;
        position: absolute;
        right: 20px;
        bottom: 12px;
    }
</style>
