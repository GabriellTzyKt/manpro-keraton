<script>
	import RiwayatOrganisasiKomunitasLog from './RiwayatOrganisasiKomunitasLog.svelte'; // Komponen log yang sudah dibuat sebelumnya
	export let komunitas = [
		{
			namaOrganisasi: 'Sinau Batik',
			tanggalBergabung: '01-03-2021',
			peran: 'Anggota',
			jumlahAnggota: 50
		},
		{
			namaOrganisasi: 'Solo Societeit',
			tanggalBergabung: '15-05-2020',
			peran: 'Pengurus',
			jumlahAnggota: 30
		}
	]; // Data contoh komunitas
</script>

<section class="riwayat-komunitas-container">
	<div class="riwayat-header">
		<h3>Komunitas</h3>
		<div class="search-filter">
			<input type="text" placeholder="Cari" class="search-input" />
			<select class="filter-dropdown">
				<option value="">Keterangan</option>
				<option value="komunitas1">Komunitas 1</option>
				<option value="komunitas2">Komunitas 2</option>
			</select>
		</div>
	</div>

	<div class="riwayat-content">
		{#each komunitas as kom}
			<RiwayatOrganisasiKomunitasLog
				namaOrganisasi={kom.namaOrganisasi}
				tanggalBergabung={kom.tanggalBergabung}
				peran={kom.peran}
				jumlahAnggota={kom.jumlahAnggota.toString()}
			/>
		{/each}
	</div>
</section>

<style>
	.riwayat-komunitas-container {
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
