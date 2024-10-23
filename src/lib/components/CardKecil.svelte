<script>
	export let imageSrc;
	export let imageAlt = 'Situs Bersejarah'; // Deskripsi gambar default
	export let title;
</script>

<div class="card">
	<img src={imageSrc} alt={imageAlt} class="card-img" />
	<div class="card-body">
		<h2 class="card-title">{title}</h2>
		<a href="/loginKraton" class="card-link">Selanjutnya →</a>
	</div>
</div>

<style>
	.card {
		width: 340px;
		height: 300px;
		border-radius: 20px;
		overflow: hidden;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		font-family: 'Poppins', sans-serif;
		display: flex;
		flex-direction: column;
		position: relative;
	}

	.card-img {
		width: 100%;
		height: 180px;
		object-fit: cover;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
	}

	.card-body {
		padding: 20px 24px 24px 24px; /* Jarak padding untuk body */
		display: flex;
		flex-direction: column;
		justify-content: space-between; /* Pastikan judul dan konten tersusun dengan baik */
		flex-grow: 1;
	}

	.card-title {
		font-size: 16px;
		font-weight: 600;
		color: #0b2e4b;
	}

	.card-link {
		font-size: 16px;
		color: #629a34;
		text-decoration: none;
		font-weight: bold;
		cursor: pointer;
		position: absolute; /* Position absolute untuk memposisikan di bawah kanan */
		right: 20px;
		bottom: 12px;
	}

	.card-link:hover {
		text-decoration: underline;
	}
</style>
