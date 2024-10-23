<script>
	// @ts-nocheck

	import { catalog } from '$lib/catalog';

	const randomIndex = Math.floor(Math.random() * 5);
	const chosenPoster = catalog[randomIndex];
</script>

<h1 class="text-2xl font-bold text-center">What Do You Want to Watch?</h1>

<br />

<div class="grid place-items-center">
	<img src={chosenPoster.source} alt={chosenPoster.title} class="w-64" />

	<br />

	<h2>{chosenPoster.title}</h2>
</div>
