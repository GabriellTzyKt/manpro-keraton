<script>
	import ProfileInfo from '$lib/components/ProfileInfo.svelte';
	import RiwayatAcara from '$lib/components/RiwayatAcara.svelte';
	import RiwayatOrganisasi from '$lib/components/RiwayatOrganisasi.svelte';
	import RiwayatKomunitas from '$lib/components/RiwayatKomunitas.svelte';
	import ButtonAction from '$lib/components/ButtonAction.svelte';
	import NavBarL from '$lib/components/NavBarL.svelte';

	// Dummy data untuk komponen ProfileInfo
	let namaLengkap = 'Sri Apriliani Ririn';
	let tempatLahir = 'Solo';
	let tanggalLahir = '12-12-2000';
	let alamat = 'Jl. Surakarta';
	let jenisKelamin = 'Perempuan';
	let wongso = 'Jawa';
	let email = 'sirapriliani@gmail.com';
	let noTelepon = '081357474986';
	let hobi = 'Mendengar musik';
	let pekerjaan = 'Pekerjaan';
	let agama = 'Agama';
	let asmaDalem = 'Ranu Wijayanti';
	let namaAyah = 'Ayah';
	let namaIbu = 'Ibu';
	let gelar = 'Nyi Lurah (NyL)';

	// Dummy data untuk RiwayatAcara
	let acara = [
		{
			title: 'Grebeg Maulud',
			location: 'Keraton Surakarta Hadiningrat',
			date: '19 Juli 2023 (1 Suro 2023)',
			organizer: 'Keraton Kasunanan Surakarta Hadiningrat'
		},
		{
			title: 'Grebeg Maulud',
			location: 'Keraton Surakarta Hadiningrat',
			date: '19 Juli 2023 (1 Suro 2023)',
			organizer: 'Keraton Kasunanan Surakarta Hadiningrat'
		},
		{
			title: 'Grebeg Maulud',
			location: 'Keraton Surakarta Hadiningrat',
			date: '19 Juli 2023 (1 Suro 2023)',
			organizer: 'Keraton Kasunanan Surakarta Hadiningrat'
		}
	];

	// Dummy data untuk RiwayatOrganisasi
	let organisasi = [
		{
			namaOrganisasi: 'Bregada - Prajurit Keraton Surakarta Hadiningrat',
			tanggalBergabung: 'DD-MM-YYYY',
			peran: 'Anggota',
			jumlahAnggota: 50
		},
		{
			namaOrganisasi: 'Bregada - Prajurit Keraton Surakarta Hadiningrat',
			tanggalBergabung: 'DD-MM-YYYY',
			peran: 'Anggota',
			jumlahAnggota: 50
		}
	];

	// Dummy data untuk RiwayatKomunitas
	let komunitas = [
		{
			namaOrganisasi: 'Sinau Batik',
			tanggalBergabung: 'DD-MM-YYYY',
			peran: 'Anggota',
			jumlahAnggota: 50
		}
	];
</script>

<NavBarL />

<section class="profile-page">
	<h2 class="section-title">Profil</h2>

	<!-- Bagian atas profil (Profile Info) -->
	<section class="profile-container p-8">
		<div class="grid-layout">
			<!-- Foto Profil (Kiri Atas) -->
			<div class="profile-picture">
				<img src="static\iconProfile.svg" alt="Foto Profil" class="rounded-full" />
			</div>

			<!-- Info Profil (Kiri Bawah) -->
			<div class="profile-info p-6 rounded-lg">
				<ProfileInfo
					{namaLengkap}
					{tempatLahir}
					{tanggalLahir}
					{alamat}
					{jenisKelamin}
					{wongso}
					{email}
					{noTelepon}
					{hobi}
					{pekerjaan}
					{agama}
					{asmaDalem}
					{namaAyah}
					{namaIbu}
					{gelar}
				/>
			</div>

			<!-- Tombol Aksi (Kanan Atas) -->
			<div class="action-buttons-container">
				<!-- Tambahkan div baru untuk kontainer button -->
				<div class="action-buttons p-6 rounded-lg flex justify-between">
					<ButtonAction label="Barcode" />
					<ButtonAction label="Ubah" color="blue" />
					<ButtonAction label="Logout" color="red" />
				</div>
			</div>

			<!-- Riwayat (Kanan Bawah) -->
			<div class="history-container">
				<div class="p-6 rounded-lg ">
					<RiwayatAcara {acara} />
				</div>

				<div class="p-6 rounded-lg ">
					<RiwayatOrganisasi {organisasi} />
				</div>

				<div class="p-6 rounded-lg ">
					<RiwayatKomunitas {komunitas} />
				</div>
			</div>
		</div>
	</section>
</section>

<style>
	.profile-container {
		background-color: #f5f5f5;
		padding: 0 24px;
	}

	.grid-layout {
		display: grid;
		grid-template-columns: 1fr 1fr;
		grid-template-rows: auto auto;
		gap: 20px;
	}

	.profile-picture {
		grid-column: 1;
		grid-row: 1;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.profile-info {
		grid-column: 1;
		grid-row: 2;
	}

	.action-buttons-container {
		grid-column: 2;
		grid-row: 1;
		display: flex;
		justify-content: flex-end; /* Pastikan tombol berada di kanan */
	}

	.action-buttons {
		display: flex;
		gap: 12px; /* Tambahkan gap untuk memberi jarak antar tombol */
	}

	.history-container {
		grid-column: 2;
		grid-row: 2;
	}

	.section-title {
		font-size: 36px;
		color: #004da3;
		font-weight: bold;
		font-family: 'Poppins', sans-serif;
		padding-top: 24px;
		padding-bottom: 16px;
		text-align: center;
		background-color: #f5f5f5;
	}

	.action-buttons {
		padding: 10px 20px;
		border-radius: 5px;
		font-weight: bold;
		cursor: pointer;
		transition: opacity 0.3s ease;
	}

	/* button:hover {
		opacity: 0.8;
	} */

	/* Custom color styles */
	/* button.white {
		background-color: white;
		border: 2px solid #004da3;
		color: #004da3;
	}

	button.yellow {
		background-color: #ffcc00;
		border: 2px solid #ffcc00;
		color: white;
	}

	button.red {
		background-color: #ff6666;
		border: 2px solid #ff6666;
		color: white;
	} */
</style>
