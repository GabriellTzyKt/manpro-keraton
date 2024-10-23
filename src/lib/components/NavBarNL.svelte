<!-- src/lib/Navbar.svelte -->
<script>
</script>

<nav class="navbar">
	<img src="/logoKraton.png" alt="logoKraton" />
	<a href="\loginKraton">Masuk</a>
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
        /* padding: 1 rem; */
	}

	.navbar a {
		color: #ffff;
		text-decoration: none;
		font-size: 20px;
	}
</style>
