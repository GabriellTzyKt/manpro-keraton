<script>
  import { onMount } from 'svelte';

  let username = '';
  let password = '';
  let errorMessage = '';

  const correctUsername = "c14220153";
  const correctPassword = "1234567890";

  function login() {
    errorMessage = '';

    if (username === correctUsername && password === correctPassword) {
      window.location.href = "/beranda";
    } else {
      errorMessage = "Username atau kata sandi salah!";
    }
  }

  onMount(() => {
    const loginButton = document.getElementById('login-button');
    loginButton.onclick = login;
  });
</script>

<main class="layout">
  <div class="navbar"></div>
  <div class="menu-container">
    <div class="menu-card">
      <img src="/src/lib/images/logo.svg" alt="logo">
      <h1 class="title">Administrasi Keraton Surakarta</h1>
      <label for="username" class="label">Username</label>
      <input bind:value={username} id="username" type="text" class="input-field" placeholder="Username">
      <label for="password" class="label">Kata Sandi</label>
      <input bind:value={password} id="password" type="password" class="input-field" placeholder="Kata Sandi">
      <p id="error-message" class="error">{errorMessage}</p>
      <button id="login-button" class="button button-blue">Masuk</button>
    </div>
  </div>
</main>

<style>
  .layout {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100vw;
    height: 100vh;
    background-image: url("src/lib/images/bg.svg");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
  .navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 60px;
    background-color: #0B2E4B;
    display: flex;
    align-items: center;
    padding: 0 20px;
    box-sizing: border-box;
  }
  .menu-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }
  .title {
    text-align: center;
  }
  .menu-card {
    display: grid;
    grid-template-columns: 1fr;
    background-color: white;
    border: solid 3px;
    border-radius: 8px;
    padding: 20px;
    gap: 8px;
    font-size: 16px;
    font-weight: bold;
    justify-items: center;
    align-items: center;
    width: 400px;
  }
  .label {
    justify-self: left;
    font-size: 14px;
    color: black;
  }
  .input-field {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    border: solid 1px #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }
  .button {
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    background-color: #004DA3;
    border: none;
    border-radius: 25px;
    width: 100%;
    height: 50px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
    margin-top: 10px;
  }
  .error {
    margin-top: 10px;
    font-size: 14px;
    color: red;
    text-align: center;
  }
</style>
