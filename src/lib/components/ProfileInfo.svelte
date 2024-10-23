<script>
	export let namaLengkap = 'Sri Apriliani Ririn';
	export let tempatLahir = 'Solo';
	export let tanggalLahir = '12-12-2000';
	export let alamat = 'Jl. Surakarta';
	export let jenisKelamin = 'Perempuan';
	export let suku = 'Jawa';
	export let email = 'sirapriliani@gmail.com';
	export let noTelepon = '081357474986';
	export let hobi = 'Mendengar musik';
	export let pekerjaan = 'Pekerjaan';
	export let agama = 'Agama';
	export let asmaDalem = 'Ranu Wijayanti';
	export let namaAyah = 'Ayah';
	export let namaIbu = 'Ibu';
	export let gelar = 'Nyi Lurah (NyL)';
	export let wongso = 'Jawa'; // Wongso diisi "Jawa"
</script>

<div class="profil-info-container">
	<!-- Informasi Pribadi -->
	<div class="field-group">
		<strong>Nama Lengkap</strong>
		<p>{namaLengkap}</p>
	</div>
	<div class="field-group">
		<strong>Tempat Lahir</strong>
		<p>{tempatLahir}</p>
	</div>
	<div class="field-group">
		<strong>Tanggal Lahir</strong>
		<p>{tanggalLahir}</p>
	</div>
	<div class="field-group">
		<strong>Alamat</strong>
		<p>{alamat}</p>
	</div>
	<div class="field-group">
		<strong>Jenis Kelamin</strong>
		<p>{jenisKelamin}</p>
	</div>
	<div class="field-group">
		<strong>Suku</strong>
		<p>{suku}</p>
	</div>
	<div class="field-group">
		<strong>Email</strong>
		<p>{email}</p>
	</div>
	<div class="field-group">
		<strong>No Telepon</strong>
		<p>{noTelepon}</p>
	</div>
	<div class="field-group">
		<strong>Hobi</strong>
		<p>{hobi}</p>
	</div>
	<div class="field-group">
		<strong>Pekerjaan</strong>
		<p>{pekerjaan}</p>
	</div>
	<div class="field-group">
		<strong>Agama</strong>
		<p>{agama}</p>
	</div>

	<!-- Informasi Keluarga dan Gelar -->
	<div class="field-group">
		<strong>Asma Dalem</strong>
		<p>{asmaDalem}</p>
	</div>
	<div class="field-group">
		<strong>Nama Ayah</strong>
		<p>{namaAyah}</p>
	</div>
	<div class="field-group">
		<strong>Nama Ibu</strong>
		<p>{namaIbu}</p>
	</div>
	<div class="field-group">
		<strong>Gelar</strong>
		<p>{gelar}</p>
	</div>
	<div class="field-group">
		<strong>Wongso</strong>
		<!-- Wongso ditampilkan di sini -->
		<p>{wongso}</p>
	</div>
</div>

<style>
	.profil-info-container {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 16px;
		padding: 16px;
	}

	.field-group {
		background-color: #f0f4ff;
		padding: 16px;
		border-radius: 8px;
	}

	strong {
		font-weight: bold;
		color: #004da3;
	}

	p {
		margin-top: 4px;
		font-size: 16px;
	}

	/* Responsif: Tampilkan 1 kolom di layar yang lebih kecil */
	@media (max-width: 768px) {
		.profil-info-container {
			grid-template-columns: 1fr;
		}
	}
</style>
