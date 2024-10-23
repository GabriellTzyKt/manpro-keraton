<script>
	import { goto } from '$app/navigation';
	import { catalog } from '$lib/catalog';
</script>

<div class="grid items-center grid-cols-3 gap-2 gap-y-4">
	{#each catalog as c}
		<button
			on:click={() => {
				goto('/order/' + c.id);
			}}
		>
			<div class="grid place-items-center">
				<img src={c.source} alt={c.title} class="w-64 aspect-[2/3]" />

				<br />

				<h2 class="text-lg font-bold">{c.title}</h2>
			</div>
		</button>
	{/each}
</div>
