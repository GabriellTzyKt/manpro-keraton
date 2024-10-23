<script>
  // Props yang akan diterima oleh komponen
  export let title;
  export let location;
  export let date;
  export let organizer;
</script>

<!-- Struktur HTML komponen -->
<div class="riwayat-container">
  <div class="riwayat-header">
      <h3>{title}</h3>
  </div>
  <div class="riwayat-body">
      <p><strong>Diadakan di:</strong> {location}</p>
      <p><strong>Tanggal:</strong> <a href="#">{date}</a></p>
      <p><strong>Oleh:</strong> {organizer}</p>
  </div>
</div>

<!-- Styling -->
<style>
  .riwayat-container {
      border-radius: 12px;
      background-color: #f0f4ff;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      padding: 16px;
      margin-bottom: 16px;
      font-family: 'Poppins', sans-serif;
  }

  .riwayat-header {
      background-color: #629ada;
      color: white;
      padding: 8px;
      border-radius: 8px 8px 0 0;
      font-weight: bold;
  }

  .riwayat-body {
      background-color: white;
      padding: 8px;
      border-radius: 0 0 8px 8px;
      color: #333;
  }

  p {
      margin: 4px 0;
      line-height: 1.6;
  }

  a {
      color: #1e40af;
      text-decoration: underline;
  }
</style>
