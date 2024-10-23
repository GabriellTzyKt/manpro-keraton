<script>
	// @ts-nocheck

	import Menu from '$lib/Menu.svelte';
	import Navbar from '$lib/Navbar.svelte';
</script>

<Navbar title="XXV">
	<Menu title="Home" href="/"></Menu>
	<Menu title="Catalog" href="/catalog"></Menu>
</Navbar>

<div class="p-4">
	<slot />
</div>
