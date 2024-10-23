<script>
	import NavBarL from '$lib/components/NavBarL.svelte';
	import TabNav from '$lib/components/TabNav.svelte';

	// Definisikan array buttons untuk navigasi tab
	const buttons = [
		{ text: 'Akan Datang', href: '/acara/acaraAkanDatang' },
		{ text: 'Selesai', href: '/acara/acaraSelesai' }
	];
</script>

<!-- Bagian utama layout -->
<main>
	<!-- Tempatkan Navbar di bagian atas -->
	<slot name="navbar" />
	<NavBarL />

	<!-- Judul halaman -->
	<h1 class="section-title">Acara</h1>

	<!-- Kontainer untuk TabNav -->
	<div class="tab-nav-container">
		<TabNav {buttons} />
		<!-- Panggil komponen TabNav dan operkan buttons -->
	</div>

	<!-- Tempat untuk memuat konten halaman (dari masing-masing page) -->
	<slot />
</main>

<style>
	/* Gaya untuk kontainer TabNav */
	.tab-nav-container {
		/* margin-bottom: 20px; */
		display: flex;
		justify-content: center; /* Posisikan navigasi tab di tengah */
		background-color: #f5f5f5;
	}

	/* Gaya untuk judul halaman */
	.section-title {
		font-size: 36px;
		font-weight: bold;
		text-align: center;
		color: #004da3;
		background-color: #f5f5f5;
		padding-top:20px ;
		padding-bottom: 16px;
	}
</style>
