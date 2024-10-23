<script>
    export let label;
    export let href;
</script>

<a href={href} class="button-lihat-semua">
    {label}
</a>

<style>
    .button-lihat-semua {
        background-color: #004DA3;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 8px;
        text-decoration: none;
        cursor: pointer;
    }

    .button-lihat-semua:hover {
        background-color: #003A80; /* Lebih gelap ketika di-hover */
    }
</style>
