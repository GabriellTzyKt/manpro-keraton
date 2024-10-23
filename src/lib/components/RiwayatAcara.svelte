<script lang="ts">
	import RiwayatAcaraLog from './RiwayatAcaraLog.svelte';

	// Tentukan tipe untuk acara
	interface Acara {
		title: string;
		location: string;
		date: string;
		organizer: string;
	}

	// Properti yang diimpor ke dalam komponen ini
	export let acara: Acara[] = [];
</script>

<!-- SECTION RIWAYAT ACARA -->
<section class="riwayat-acara-container">
	<div class="riwayat-header">
		<h3>Riwayat Acara</h3>
		<div class="search-filter">
			<input type="text" placeholder="Cari" class="search-input" />
			<select class="filter-dropdown">
				<option value="">Keterangan</option>
				<option value="kegiatan1">Kegiatan 1</option>
				<option value="kegiatan2">Kegiatan 2</option>
			</select>
		</div>
	</div>

	<div class="riwayat-content">
		<!-- Lakukan pengulangan pada data acara -->
		{#each acara as event}
			<RiwayatAcaraLog
				title={event.title}
				location={event.location}
				date={event.date}
				organizer={event.organizer}
			/>
		{/each}
	</div>
</section>

<!-- CSS Styles -->
<style>
	.riwayat-acara-container {
        border: 2px solid #004da3;
		padding: 20px;
		background-color: #f9f9f9;
		border-radius: 8px;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}

	.riwayat-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 20px;
	}

	h3 {
		font-size: 24px;
		color: #004da3;
		font-weight: bold;
		font-family: 'Poppins', sans-serif;
		text-align: center;
		background-color: #f5f5f5;
	}

	.search-filter {
		display: flex;
		gap: 10px;
	}

	.search-input {
		padding: 8px;
		font-size: 16px;
		border: 1px solid #ccc;
		border-radius: 4px;
		width: 200px;
	}

	.filter-dropdown {
		padding: 8px;
		font-size: 16px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}

	.riwayat-content {
		max-height: 300px; /* Maksimal tinggi untuk konten dengan scroll */
		overflow-y: auto; /* Scroll hanya pada bagian konten */
	}
</style>
