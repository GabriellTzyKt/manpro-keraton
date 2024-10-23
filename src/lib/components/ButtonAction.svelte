<script>
	export let label = 'Button';
	export let color = '#ffc107'; // Default color
	export let onClick = () => {}; // Function untuk event handler
</script>

<button class="action-button" on:click={onClick} style="background-color: {color};">
	{label}
</button>

<style>
	.action-button {
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}

	.action-button:hover {
		opacity: 0.9; /* Optional hover effect to slightly darken the button */
	}
</style>
