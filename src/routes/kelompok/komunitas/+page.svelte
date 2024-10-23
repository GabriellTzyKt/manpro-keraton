<script>
	import CardKecil from '$lib/components/CardKecil.svelte'; // Gunakan CardKecil untuk menampilkan komunitas
</script>

<section class="kelompok-page">
	<div class="grid-layout">
		<CardKecil title="Pakasa" imageSrc="\Pakasa.jpg" />
		<CardKecil title="Sinau Batik" imageSrc="\SinauBatik.jpg" />
		<CardKecil title="Solo Societeit" imageSrc="\SoloSocieteit.JPG" />
		<CardKecil title="Pakasa" imageSrc="\Pakasa.jpg" />
		<CardKecil title="Pakasa" imageSrc="\Pakasa.jpg" />
		<CardKecil title="Sinau Batik" imageSrc="\SinauBatik.jpg" />
		<CardKecil title="Solo Societeit" imageSrc="\SoloSocieteit.JPG" />
		<CardKecil title="Pakasa" imageSrc="\Pakasa.jpg" />
	</div>
</section>

<style>
	.kelompok-page {
		padding: 20px 40px;
		background-color: #f5f5f5;
		max-width: 100%;
		margin: 0 auto;
	}

	.grid-layout {
		display: grid;
		grid-template-columns: repeat(4, 1fr); /* 3 card per baris */
		gap: 20px;
		width: 100%;
		padding-left: 10px;
		padding-right: 10px;
	}

	@media (max-width: 1200px) {
		.grid-layout {
			grid-template-columns: repeat(2, 1fr);
		}
	}

	@media (max-width: 768px) {
		.grid-layout {
			grid-template-columns: 1fr;
		}
	}
</style>
