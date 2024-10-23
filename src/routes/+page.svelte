<script>
	import ButtonLihatSemua from '$lib/components/ButtonLihatSemua.svelte';
	import CardAbout from '$lib/components/CardAbout.svelte';
	import CardBesar from '$lib/components/CardBesar.svelte';
	import CardKecil from '$lib/components/CardKecil.svelte';
	import HeroSection from '$lib/components/HeroSection.svelte';
	import NavBarNl from '$lib/components/NavBarNL.svelte';
</script>

<NavBarNl />

<!-- SECTION HERO -->
<HeroSection />

<!-- SECTION ABOUT KERATON  -->
<section class="flex flex-col justify-center items-center gap-8 py-16 px-4 bg-black bg-opacity-30">
	<!-- Title Section -->
	<h2 class="section-title">Tentang Kraton Solo</h2>

	<!-- Card Components -->
	<div class="flex justify-center gap-8">
		<CardAbout
			content="Keraton Surakarta Hadiningrat adalah istana resmi Kesultanan Surakarta, yang didirikan oleh Paku Buwono II pada tahun 1745. Terletak di kota Surakarta, Jawa Tengah, keraton ini merupakan salah satu pusat kebudayaan Jawa dan simbol dari keberlanjutan tradisi kerajaan di Indonesia. Selain sebagai kediaman resmi raja-raja Surakarta, keraton juga berfungsi sebagai pusat spiritual, sosial, dan budaya, serta menyimpan berbagai artefak bersejarah yang berkaitan dengan sejarah kerajaan dan tradisi Jawa."
			imageSrc="\KeratonSurakartaAbt.jpg"
			bgColor="#AC9794"
		/>
		<CardAbout
			content="Keraton Surakarta menaungi berbagai organisasi dan komunitas yang berkomitmen untuk melestarikan budaya lokal. Berbagai kelompok, seperti paguyuban seni, komunitas penggiat sejarah, dan kelompok pembelajaran seni, aktif dalam menyelenggarakan kegiatan budaya dan pendidikan. Jumlah organisasi yang beragam ini mencerminkan dedikasi keraton dalam menjaga dan mengembangkan warisan budaya yang kaya."
			imageSrc="\KeratonSurakartaAbt2.jpg"
			bgColor="#7BA8D3"
		/>
		<CardAbout
			content="Keraton Surakarta memiliki jumlah abdi yang sangat banyak, mencakup berbagai peran dan tingkatan dalam struktur keraton. Beberapa di antaranya bahkan berasal dari mancanegara, yang menunjukkan daya tarik dan nilai historis dari tradisi keraton. Keberadaan abdi dari luar negeri ini mencerminkan komitmen internasional dalam melestarikan dan mempelajari warisan budaya yang kaya dan beragam di Surakarta."
			imageSrc="\KeratonSurakartaAbt3.jpg"
			bgColor="#AE9980"
		/>
	</div>
</section>

<!-- Section Situs Bersejarah -->
<section class="bg-gray-100 py-10 px-8">
	<!-- Wrapper untuk judul dan button dalam satu flex container -->
	<div class="flex justify-between items-center mb-8">
		<h2 class="section-title">Situs Bersejarah</h2>
		<!-- Button di sini untuk align dengan judul -->
		<ButtonLihatSemua href="/loginKraton" label="Lihat Semua" />
	</div>

	<!-- Flex Layout untuk Cards dan Button -->
	<div class="grid-layout">
		<!-- Card Components -->
		<CardBesar
			title="Keraton Surakarta Hadiningrat"
			content="Keraton Surakarta Hadiningrat didirikan oleh Paku Buwono II pada tahun 1745 di Surakarta, Jawa Tengah. Keraton ini merupakan pusat kebudayaan dan pemerintahan Kesultanan Surakarta, sekaligus tempat tinggal keluarga kerajaan. Dengan arsitektur megah khas Jawa, keraton ini menjadi simbol keberlanjutan tradisi kerajaan serta pusat spiritual dan sosial yang penting dalam sejarah Indonesia."
			imageSrc="\KeratonSurakarta.jpg"
			id={1}
		/>
		<CardBesar
			title="Pesanggerahan Langenharjo"
			content="Pesanggrahan Langenharjo dibangun pada masa Pakubuwono X di akhir abad ke-19 di Sukoharjo, Jawa Tengah, sebagai tempat istirahat keluarga Keraton Surakarta. Selain itu, pesanggrahan ini juga menjadi lokasi upacara adat dan ritual keagamaan, dengan mata air keramat yang diyakini memiliki kekuatan spiritual. Arsitekturnya yang khas Jawa menjadikannya situs penting dalam sejarah dan budaya lokal."
			imageSrc="\Langenharjo.jpg"
			id={2} 
		/>
		<CardBesar
			title="Bunker Kuno Surakarta"
			content="Berukuran 16×24 meter, bunker ini pertama kali ditemukan pada tahun 2012. Saat diteliti oleh tim arkeologi dari Yogyakarta, bunker ini diperkirakan dibangun pada tahun 1800-an. Hal ini terlihat dari struktur dan ciri bangunan yang ada. Dari temuan-temuan yang ada, bunker ini kemungkinan besar dibangun pada saat masa Pemerintah Kolonial Belanda ketika menduduki wilayah Kota Solo."
			imageSrc="\BunkerKunoSurakarta.jpg"
			id={3} 
		/>
		<CardBesar
			title="Umbul Tirto Mulyo"
			content="Umbul Tirtomulyo adalah sebuah mata air alami yang terletak di Surakarta, Jawa Tengah. Dikenal karena kejernihan airnya yang memukau, tempat ini menjadi salah satu tujuan wisata populer bagi penduduk lokal maupun wisatawan. Dengan suasana yang tenang dan pemandangan alam yang indah, Umbul Tirtomulyo menawarkan pengalaman rekreasi yang menyegarkan."
			imageSrc="\UmbulTirtoMulyo.jpg"
			id={4} 
		/>
	</div>
</section>

<!-- Section Acara -->
<section class="bg-gray-100 py-10 px-8">
	<!-- Wrapper untuk judul dan button dalam satu flex container -->
	<div class="flex justify-between items-center mb-8">
		<h2 class="section-title">Acara</h2>
		<!-- Button di sini untuk align dengan judul -->
		<ButtonLihatSemua href="/loginKraton" label="Lihat Semua" />
	</div>

	<!-- Flex Layout untuk Cards dan Button -->
	<div class="grid-layout">
		<!-- Card Components -->
		<CardBesar
			title="Kirab Malam 1 Suro"
			content="kirab satu Suro di Keraton Surakarta berasal sejak masa pemerintahan Raja Pakubuwono X yang bertahta pada periode 1893–1939. Acara kirab pusaka identik dengan penggunaan kerbau bule atau kebo bule, sehingga sering disebut dengan Kirab Kebo Bule. Pada 2023, kirab malam 1 suro Keraton Surakarta akan melewati rute Khusus dilewati sama seperti tahun-tahun sebelumnya. "
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

<!-- Section organisasi -->
<section class="bg-gray-100 py-10 px-8">
	<!-- Wrapper untuk judul dan button dalam satu flex container -->
	<div class="flex justify-between items-center mb-8">
		<h2 class="section-title">Organisasi</h2>
		<!-- Button di sini untuk align dengan judul -->
		<ButtonLihatSemua href="/loginKraton" label="Lihat Semua" />
	</div>

	<!-- Grid Layout untuk Cards Kecil -->
	<div class="grid-layout">
		<CardKecil title="Bregada - Prajurit Karaton Surakarta" imageSrc="\Bregada.png" />
		<CardKecil title="Putri Narpo Wandowo" imageSrc="\PutriNarpoWandowo.jpg" />
		<CardKecil
			title="Lembaga Dewan Adat Keraton Surakarta"
			imageSrc="\LembagaDewanAdatKeratonSurakarta.jpg"
		/>
		<CardKecil title="Bregada - Prajurit Karaton Surakarta" imageSrc="\Bregada.png" />
	</div>
</section>

<!-- Section Komunitas -->
<section class="bg-gray-100 py-10 px-8">
	<!-- Wrapper untuk judul dan button dalam satu flex container -->
	<div class="flex justify-between items-center mb-8">
		<h2 class="section-title">Komunitas</h2>
		<!-- Button di sini untuk align dengan judul -->
		<ButtonLihatSemua href="/loginKraton" label="Lihat Semua" />
	</div>

	<!-- Grid Layout untuk Cards Kecil -->
	<div class="grid-layout">
		<CardKecil title="Pakasa" imageSrc="\Pakasa.jpg" />
		<CardKecil title="Sinau Batik" imageSrc="\SinauBatik.jpg" />
		<CardKecil title="Solo Societeit" imageSrc="\SoloSocieteit.JPG" />
		<CardKecil title="Pakasa" imageSrc="\Pakasa.jpg" />
	</div>
</section>

<style>
	.section-title {
		font-size: 24px;
		color: #004da3;
		font-weight: bold;
		font-family: 'Poppins', sans-serif;
		margin-bottom: 24px;
		margin-top: 0px;
	}

	.grid-layout {
		display: flex;
		flex-wrap: wrap;
		gap: 10px;
		justify-content: space-between;
	}

	/* Responsif untuk layar yang lebih kecil */
	@media (max-width: 1200px) {
		.grid-layout {
			grid-template-columns: repeat(2, 1fr); /* 2 kolom card untuk tablet */
		}
	}

	@media (max-width: 768px) {
		.grid-layout {
			grid-template-columns: 1fr; /* 1 kolom card untuk mobile */
		}
	}
</style>
