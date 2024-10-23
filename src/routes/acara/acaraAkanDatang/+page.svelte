<script>
	import CardBesar from '$lib/components/CardBesar.svelte'; // Import CardBesar untuk menampilkan acara
	import NavBarL from '$lib/components/NavBarL.svelte';
</script>

<!-- <NavBarL /> -->

<section class="acara-page">
	<!-- <h2 class="section-title">Acara akan Datang</h2> -->

	<!-- <div class="section-header">
		<div class="filter-buttons">
			<button class="filter-btn active">Akan Datang</button>
			<button class="filter-btn">Selesai</button>
		</div>
	</div> -->

	<div class="grid-layout">
		<CardBesar
			title="Kirab Malam 1 Suro"
			content="kirab satu Suro di Keraton Surakarta berasal sejak masa pemerintahan Raja Pakubuwono X yang bertahta pada periode 1893–1939. Acara kirab pusaka identik dengan penggunaan kerbau bule atau kebo bule, sehingga sering disebut dengan Kirab Kebo Bule. Pada 2023, kirab malam 1 suro Keraton Surakarta akan melewati rute Khusus dilewati sama seperti tahun-tahun sebelumnya."
			imageSrc="\Kirab1Suro.jpg"
		/>
		<CardBesar
			title="Garebeg Pasa"
			content="Garebeg Pasa adalah tradisi tahunan di Keraton Yogyakarta dan Surakarta yang merayakan hari raya Idul Fitri dan Idul Adha. Acara ini ditandai dengan prosesi membawa gunungan berisi hasil bumi, makanan, dan barang-barang simbolis ke masjid untuk dibagikan kepada masyarakat. Garebeg Pasa mencerminkan rasa syukur atas rezeki yang diterima serta menguatkan hubungan antara keraton dan rakyat."
			imageSrc="\GarebegPasa.jpg"
		/>
		<CardBesar
			title="Tinggalan Dalem Jumenengan"
			content="Tingalan Dalem Jumenengan adalah tradisi yang diadakan di Keraton Surakarta untuk merayakan kenaikan tahta raja baru. Acara ini meliputi serangkaian ritual dan upacara adat yang melambangkan penerimaan dan dukungan masyarakat terhadap pemimpin baru. Kegiatan ini juga menonjolkan nilai-nilai budaya dan spiritual yang kuat dalam masyarakat Jawa."
			imageSrc="\TinggalanDalemJumenengan.jpg"
		/>
		<CardBesar
			title="Sesaji Mahesa Lawung"
			content="Sesaji Mahesa Lawung adalah tradisi dalam ritual keagamaan di Keraton Surakarta yang melibatkan persembahan berupa sesaji atau makanan kepada Dewi Sri, dewi padi dan kesuburan. Tradisi ini dilakukan untuk memohon berkah dan kesuburan hasil pertanian kepada Tuhan. Sesaji Mahesa Lawung mencerminkan hubungan erat antara masyarakat dengan alam dan budaya pertanian Jawa."
			imageSrc="\SesajiMahesaLawung.jpg"
		/>
		<CardBesar
			title="Kirab Malam 1 Suro"
			content="kirab satu Suro di Keraton Surakarta berasal sejak masa pemerintahan Raja Pakubuwono X yang bertahta pada periode 1893–1939. Acara kirab pusaka identik dengan penggunaan kerbau bule atau kebo bule, sehingga sering disebut dengan Kirab Kebo Bule. Pada 2023, kirab malam 1 suro Keraton Surakarta akan melewati rute Khusus dilewati sama seperti tahun-tahun sebelumnya."
			imageSrc="\Kirab1Suro.jpg"
		/>
		<CardBesar
			title="Garebeg Pasa"
			content="Garebeg Pasa adalah tradisi tahunan di Keraton Yogyakarta dan Surakarta yang merayakan hari raya Idul Fitri dan Idul Adha. Acara ini ditandai dengan prosesi membawa gunungan berisi hasil bumi, makanan, dan barang-barang simbolis ke masjid untuk dibagikan kepada masyarakat. Garebeg Pasa mencerminkan rasa syukur atas rezeki yang diterima serta menguatkan hubungan antara keraton dan rakyat."
			imageSrc="\GarebegPasa.jpg"
		/>
		<CardBesar
			title="Tinggalan Dalem Jumenengan"
			content="Tingalan Dalem Jumenengan adalah tradisi yang diadakan di Keraton Surakarta untuk merayakan kenaikan tahta raja baru. Acara ini meliputi serangkaian ritual dan upacara adat yang melambangkan penerimaan dan dukungan masyarakat terhadap pemimpin baru. Kegiatan ini juga menonjolkan nilai-nilai budaya dan spiritual yang kuat dalam masyarakat Jawa."
			imageSrc="\TinggalanDalemJumenengan.jpg"
		/>
		<CardBesar
			title="Sesaji Mahesa Lawung"
			content="Sesaji Mahesa Lawung adalah tradisi dalam ritual keagamaan di Keraton Surakarta yang melibatkan persembahan berupa sesaji atau makanan kepada Dewi Sri, dewi padi dan kesuburan. Tradisi ini dilakukan untuk memohon berkah dan kesuburan hasil pertanian kepada Tuhan. Sesaji Mahesa Lawung mencerminkan hubungan erat antara masyarakat dengan alam dan budaya pertanian Jawa."
			imageSrc="\SesajiMahesaLawung.jpg"
		/>
	</div>
</section>

<style>
	.acara-page {
		padding: 20px 40px;
		background-color: #f5f5f5;
		max-width: 100%; /* Pastikan lebar maksimalnya 100% */
		margin: 0 auto; /* Tengah secara horizontal */
	}

	.grid-layout {
		display: grid;
		grid-template-columns: repeat(4, 1fr); /* 4 card per baris */
		gap: 20px;
		width: 100%; /* Buat grid memenuhi lebar penuh */
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
