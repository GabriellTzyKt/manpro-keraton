<script>
	import NavBarL from '$lib/components/NavBarL.svelte';

	// Data detail situs
	export let detail = {
		title: 'Umbul Tirto Mulyo',
		pembangun: 'Sri Sultan Pangku Buwono (PB) X',
		tahunBerdiri: 1925,
		jamOperasional: '06.00 - 18.00',
		penanggungJawab: 'Abraham Christofer',
		jenisSitus: 'Petirtaan',
		lokasi:
			'CMFH+3FR, Unnamed Road, Dusun 2, Gombang, Kec. Sawit, Kabupaten Boyolali, Jawa Tengah 57374',
		koordinat: '7.5116° LS, 110.6657° BT',
		description: `Umbul Tirto Mulyo merupakan tempat sumber mata air yang berupa kolam pemandian. Nama umbul diambil dari kata “mumbul” yang artinya naik. 
        Umbul Tirtomulyo merupakan pemandian yang berlokasi di Desa Kemasan, Kecamatan Sawit, Kabupaten Boyolali. Umbul Tirtomulyo terletak sangat strategis, walau tempatnya lumayan jauh dari jalan Solo-Jogja.
        Umbul ini terkenal akan kejernihannya dan juga bangunan berupa tembok bata merah yang mengelilingi area kolam. Nama dan ketenaran Umbul Tirtomulyo tak terlepas dari peranan Sri Sultan Pakubuwono X yang diceritakan sering 
        melakukan upacara padusan atau sekedar tirakatan di Umbul ini. Nama Tirtomulyo itu sendiri berasal dari kata “Tirta” yang berupa air dan “Mulya” yang berarti mulia.`,
		imageSrc: 'UmbulTirtoMulyo.jpg',
		additionalImages: ['UmbulTirtoMulyo.jpg', 'UmbulTirtoMulyo.jpg', 'UmbulTirtoMulyo.jpg']
	};

	let showModal = false;
	let selectedImage = '';

	// Fungsi untuk membuka modal dengan gambar yang dipilih
	function openModal(image) {
		selectedImage = image;
		showModal = true;
	}

	// Fungsi untuk menutup modal
	function closeModal() {
		showModal = false;
		selectedImage = '';
	}
</script>

<NavBarL />

<div class="container">
	<!-- Gambar utama -->
	<img src={detail.imageSrc} alt={detail.title} class="main-image" />

	<!-- Informasi utama -->
	<div class="info-grid">
		<p><i class="fas fa-user"></i> Dibangun oleh: {detail.pembangun}</p>
		<p><i class="fas fa-calendar-alt"></i> Tahun Berdiri: {detail.tahunBerdiri}</p>
		<p><i class="fas fa-clock"></i> Jam Buka: {detail.jamOperasional}</p>
		<p><i class="fas fa-user-tie"></i> Penanggung Jawab: {detail.penanggungJawab}</p>
		<p><i class="fas fa-map-marker-alt"></i> Jenis Situs: {detail.jenisSitus}</p>
		<p><i class="fas fa-map-marker-alt"></i> Lokasi: {detail.lokasi}</p>
		<p><i class="fas fa-globe"></i> Koordinat: {detail.koordinat}</p>
	</div>

	<!-- Deskripsi -->
	<div class="description">
		<h2>Deskripsi</h2>
		<p>{detail.description}</p>
	</div>

	<!-- Gambar tambahan -->
	<div class="additional-images">
		{#each detail.additionalImages as image}
			<img src={image} alt="Additional Image" on:click={() => openModal(image)} />
		{/each}
	</div>

	<!-- Tombol riwayat acara -->
	<a href="#" class="btn-riwayat">Riwayat Acara</a>

	<!-- Modal untuk menampilkan gambar yang lebih besar -->
	{#if showModal}
		<div class="modal">
			<div class="modal-content">
				<span class="close" on:click={closeModal}>&times;</span>
				<img src={selectedImage} alt="Enlarged Image" class="modal-image" />
			</div>
		</div>
	{/if}
</div>

<style>
	.container {
		max-width: 1200px;
		margin: 0 auto;
		padding: 20px;
		font-family: 'Poppins', sans-serif;
		background-color: #f5f5f5;
		border-radius: 10px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}

	.info-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 20px;
		margin-bottom: 20px;
	}

	.main-image {
		width: 100%;
		height: auto;
		border-radius: 10px;
		margin-bottom: 20px;
	}

	.additional-images {
		display: flex;
		gap: 10px;
		margin-top: 20px;
	}

	.additional-images img {
		width: 100px;
		height: 100px;
		border-radius: 10px;
		object-fit: cover;
		cursor: pointer;
		transition: transform 0.3s ease;
	}

	.additional-images img:hover {
		transform: scale(1.1);
	}

	.btn-riwayat {
		display: inline-block;
		padding: 10px 20px;
		background-color: #004da3;
		color: white;
		font-size: 18px;
		font-weight: bold;
		border-radius: 8px;
		text-align: center;
		text-decoration: none;
		margin-top: 20px;
	}

	.btn-riwayat:hover {
		background-color: #003366;
	}

	/* Modal styling */
	.modal {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.modal-content {
		background-color: white;
		padding: 20px;
		border-radius: 10px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
		position: relative;
		max-width: 90%;
	}

	.modal-image {
		max-width: 100%;
		height: auto;
		border-radius: 10px;
	}

	.close {
		position: absolute;
		top: 10px;
		right: 15px;
		font-size: 24px;
		cursor: pointer;
	}
</style>
