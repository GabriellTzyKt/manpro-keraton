<script>
	import RiwayatOrganisasiKomunitasLog from './RiwayatOrganisasiKomunitasLog.svelte'; // Komponen log yang sudah dibuat sebelumnya
	export let organisasi = [
		{
			namaOrganisasi: 'Bregada - Prajurit Keraton Surakarta',
			tanggalBergabung: 'DD-MM-YYYY',
			peran: 'Anggota',
			jumlahAnggota: 50
		},
		{
			namaOrganisasi: 'Lembaga Dewan Adat Keraton',
			tanggalBergabung: '10-02-2022',
			peran: 'Ketua',
			jumlahAnggota: 100
		}
	];
</script>

<section class="riwayat-organisasi-container">
	<div class="riwayat-header">
		<h3>Organisasi</h3>
		<div class="search-filter">
			<input type="text" placeholder="Cari" class="search-input" />
			<select class="filter-dropdown">
				<option value="">Keterangan</option>
				<option value="organisasi1">Organisasi 1</option>
				<option value="organisasi2">Organisasi 2</option>
			</select>
		</div>
	</div>

	<div class="riwayat-content">
		{#each organisasi as org}
			<RiwayatOrganisasiKomunitasLog
				namaOrganisasi={org.namaOrganisasi}
				tanggalBergabung={org.tanggalBergabung}
				peran={org.peran}
				jumlahAnggota={org.jumlahAnggota.toString()}
			/>
		{/each}
	</div>
</section>

<style>
	.riwayat-organisasi-container {
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
		margin-bottom: 12px;
	}

	.search-filter {
		display: flex;
		gap: 8px;
	}

	.search-input {
		padding: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}

	.filter-dropdown {
		padding: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}

	.riwayat-content {
		max-height: 250px;
		overflow-y: auto;
	}
	h3 {
		font-size: 24px;
		color: #004da3;
		font-weight: bold;
		font-family: 'Poppins', sans-serif;
		text-align: center;
		background-color: #f5f5f5;
	}
</style>
