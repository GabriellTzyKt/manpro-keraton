<script>
    import RiwayatAcara from './RiwayatAcara.svelte';
    import RiwayatOrganisasi from './RiwayatOrganisasi.svelte';
    import RiwayatKomunitas from './RiwayatKomunitas.svelte';
</script>

<div class="riwayat-wrapper">
    <RiwayatAcara />
    <RiwayatOrganisasi />
    <RiwayatKomunitas />
</div>

<style>
    .riwayat-wrapper {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }
</style>
