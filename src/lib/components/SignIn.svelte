<script>
	let username = '';
	let password = '';
	let errorMessage = '';

	// Hardcoded credentials for login
	const usernameDefault = 'admin';
	const passDefault = '123';

	function login() {
		if (username === usernameDefault && password === passDefault) {
			console.log('Login successful');
			// Redirect or show success message
			window.alert('Login successful!');
			window.location.href = '/beranda'; 
		} else {
			console.log('Invalid credentials');
			errorMessage = 'Username atau kata sandi salah.';
		}
	}
</script>

<div class="login-form">
	<img src="/logoKraton.png" alt="logoKraton" />
	<h3>Masuk</h3>
	<form on:submit|preventDefault={login} class="flex flex-col justify-between h-full">
		<div class="flex-grow">
			<input
				type="text"
				placeholder="Username"
				bind:value={username}
				required
				class="w-full p-2 mb-4 border rounded-md border-gray-300"
			/>
			<input
				type="password"
				placeholder="Kata Sandi"
				bind:value={password}
				required
				class="w-full p-2 mb-4 border rounded-md border-gray-300"
			/>
		</div>
		{#if errorMessage}
			<p class="error-message">{errorMessage}</p>
		{/if}
		<div>
			<button
				type="submit"
				class="w-full py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition duration-300 mb-4"
				>Masuk</button
			>
			<p>
				Belum punya akun? <a href="/daftarKraton" class="text-blue-600 hover:underline">Daftar</a>
			</p>
		</div>
	</form>
</div>

<style>
	.login-form {
		background-color: rgba(255, 255, 255, 0.8);
		padding: 2rem;
		border-radius: 10px;
		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		text-align: center;
		width: 500px;
		height: 708px;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.login-form h3 {
		margin-bottom: 1.5rem;
		font-family: sans-serif;
		color: #333;
		font-size: 36px;
		font-weight: bolder;
	}

	.login-form img {
		display: block;
		margin: 0 auto 1.5rem auto;
	}

	.login-form input {
		width: 100%;
		padding: 0.75rem;
		margin-bottom: 1rem;
		border: 1px solid #ccc;
		border-radius: 5px;
		font-size: 1rem;
		border-color: #0b2e4b;
	}

	.login-form button {
		width: 100%;
		padding: 0.75rem;
		background-color: #007bff;
		color: white;
		border: none;
		border-radius: 5px;
		font-size: 1rem;
		cursor: pointer;
	}

	.login-form button:hover {
		background-color: #0056b3;
	}

	.login-form p {
		margin-top: 1rem;
	}

	.login-form a {
		color: #007bff;
		text-decoration: none;
	}

	.login-form a:hover {
		text-decoration: underline;
	}

	.error-message {
		color: red;
		margin-bottom: 1rem;
		font-size: 0.9rem;
	}
</style>
