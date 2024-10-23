<script lang="ts">
	import { page } from '$app/stores'; // Untuk mendapatkan URL saat ini
	import { get } from 'svelte/store';

	// Function untuk mengecek apakah URL saat ini dimulai dengan path tertentu
	function isActive(path: string) {
		const currentPath = get(page).url.pathname;
		return currentPath.startsWith(path);
	}
</script>

<nav class="navbar">
	<img src="/logoKraton.png" alt="logoKraton" />

	<div class="nav-links">
		<a href="/beranda" class:is-active={isActive('/beranda')}>Beranda</a>
		<a href="/situsBersejarah" class:is-active={isActive('/situsBersejarah')}>Situs</a>
		<a href="/acara/acaraAkanDatang" class:is-active={isActive('/acara')}>Acara</a>
		<a href="/kelompok/organisasi" class:is-active={isActive('/kelompok')}>Kelompok</a>
		<a href="/abdi" class:is-active={isActive('/abdi')}>Abdi</a>
	</div>

	<!-- Ikon user/profile -->
	<div class="profile">
		<!-- Tambahkan link di sekitar ikon profil -->
		<a href="/profile">
			<img src="/iconProfile.svg" alt="Profile" class="profile-icon" />
		</a>
	</div>
</nav>

<style>
	.navbar {
		position: relative;
		z-index: 10;
		top: 0;
		width: 100%;
		padding: 1rem;
		display: flex;
		justify-content: space-between;
		align-items: center;
		background-color: #0b2e4b;
	}

	.navbar img {
		height: 64px;
		width: 50px;
	}

	.nav-links {
		display: flex;
		gap: 2rem;
	}

	.nav-links a {
		color: #fff;
		text-decoration: none;
		font-size: 20px;
	}

	/* Warna saat link di-hover */
	.nav-links a:hover {
		color: #f1c40f; /* Warna hover kuning */
	}

	/* Warna link aktif */
	.nav-links a.is-active {
		color: #e74c3c; /* Warna merah saat aktif */
	}

	.profile {
		display: flex;
		align-items: center;
		height: 12 px;
		width: 12 px;
	}

	.profile-icon {
		border-radius: 10000%;
		background-color: #f1c40f;
		padding: 4px;
		cursor: pointer;
	}
</style>
