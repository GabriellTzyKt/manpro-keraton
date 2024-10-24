<script>
  import Sidebar from '/src/lib/component/sidebar.svelte';
  import Navbar from '/src/lib/component/navbar.svelte';
  import Chart from '/src/lib/component/chart.svelte'; 

  export let page = "Dashboard";
    export let user = "Sri Apriliani";
    export let Manajemen = "Organisasi";
    let isDropdownOpen = false;

    const menuItems = [
        { name: "Dashboard", href: "/MO/dashboard" },
        {
            name: "Organisasi",
            dropdown: true,
            subItems: [
                { name: "Detail Organisasi", href: "/MO/organisasi/detailO" },
                { name: "Daftar Anggota", href: "/MO/organisasi/daftarA" },
                { name: "Acara", href: "/MO/organisasi/acara" }
            ]
        }
    ];

  const toggleDropdown = (index) => {
    menuItems[index].isOpen = !menuItems[index].isOpen;
  };

  // Upcoming events data
  const upcomingEvents = [
    {
      name: "Peringatan Sekaten",
      date: "2024-11-10",
      description: "Upacara tahunan peringatan Sekaten di Keraton Yogyakarta.",
    },
    {
      name: "Grebeg Maulud",
      date: "2024-12-12",
      description: "Prosesi tradisional Grebeg Maulud di halaman Keraton.",
    },
    {
      name: "Jumenengan Dalem",
      date: "2024-11-28",
      description: "Acara tahunan penobatan raja Keraton Yogyakarta.",
    },
    {
      name: "Kirab Budaya",
      date: "2024-11-15",
      description: "Kirab budaya memperingati hari besar di Keraton.",
    },
    {
      name: "Festival Gamelan",
      date: "2024-11-22",
      description: "Festival tahunan gamelan di pelataran Keraton.",
    },
    {
      name: "Wayang Kulit Malam",
      date: "2024-12-05",
      description: "Pertunjukan wayang kulit di malam hari di Keraton.",
    },
  ];

  const stats = {
    totalEvents: 10,
    upcomingEvents: upcomingEvents.length,
    totalAttendees: 1200,
  };

  // Bar chart data for total members per month
  const barChartData = {
    labels: ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"],
    datasets: [{
      label: 'Total Anggota per Bulan',
      data: [50, 70, 60, 90, 100,95,105,110,115,110,120,125],
      backgroundColor: 'rgba(75, 192, 192, 0.2)',
      borderColor: 'rgba(75, 192, 192, 1)',
      borderWidth: 1
    }]
  };

  const barChartOptions = {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  };

  // Pie chart data for member types
  const pieChartData = {
    labels: ["Abdi Dalem", "Sentono Dalem", "Anon-Anon", "Tamu"],
    datasets: [{
      label: 'Jenis Anggota',
      data: [90, 50, 25, 25],
      backgroundColor: ['#36a2eb', '#ff6384', '#ffcd56', '#63f542'],
      hoverOffset: 4
    }]
  };

  const pieChartOptions = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      }
    }
  };
</script>

<main class="layout">
  <Sidebar {Manajemen} {menuItems} {toggleDropdown} withDropdown={true} />
  <div class="content">
    <Navbar {user} {page} />

    <div class="dashboard">
      <!-- Upcoming Events Section -->
      <section class="upcoming-events">
        <h3>Upcoming Events</h3>
        <div class="events-grid">
          {#each upcomingEvents as event}
            <div class="event-card">
              <h4>{event.name}</h4>
              <p><strong>Date:</strong> {event.date}</p>
              <p>{event.description}</p>
            </div>
          {/each}
        </div>
      </section>

      <!-- Statistics Section -->
      <section class="statistics">
        <h3>Statistics</h3>
        <div class="stat-card">
          <h4>Total Events</h4>
          <p>{stats.totalEvents}</p>
        </div>
        <div class="stat-card">
          <h4>Upcoming Events</h4>
          <p>{stats.upcomingEvents}</p>
        </div>
        <div class="stat-card">
          <h4>Total Attendees</h4>
          <p>{stats.totalAttendees}</p>
        </div>
      </section>

      <!-- Charts Section -->
      <section class="charts">
        <div class="chart-container">
          <h3>Total Anggota per Bulan</h3>
          <Chart chartData={barChartData} chartOptions={barChartOptions} chartType="bar" />
        </div>
        <div class="chart-container">
          <h3>Jenis Anggota</h3>
          <Chart chartData={pieChartData} chartOptions={pieChartOptions} chartType="pie" />
        </div>
      </section>
    </div>
  </div>
</main>

<style>
  .layout {
    display: flex;
    height: 100vh;
    font-family: sans-serif;
  }

  .content {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    margin-left: 250px;
  }

  .dashboard {
    padding: 20px;
  }

  .upcoming-events {
    margin-bottom: 30px;
  }

  .upcoming-events h3 {
    font-size: 22px;
    margin-bottom: 15px;
    color: #333;
  }

  /* Grid for upcoming events */
  .events-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
  }

  .event-card {
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .event-card h4 {
    margin-bottom: 10px;
    font-size: 18px;
    color: #333;
  }

  .statistics {
    display: flex;
    gap: 20px;
    margin-bottom: 30px;
  }

  .stat-card {
    flex-grow: 1;
    text-align: center;
  }

  .charts {
    display: flex;
    justify-content: space-between;
  }

  .chart-container {
    width: 45%;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .chart-container h3 {
    text-align: center;
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
  }

  @media (max-width: 768px) {
    .charts {
      flex-direction: column;
      align-items: center;
    }

    .chart-container {
      width: 100%;
      margin-bottom: 20px;
    }

    .statistics {
      flex-direction: column;
    }

    /* Adjust grid layout for smaller screens */
    .events-grid {
      grid-template-columns: repeat(1, 1fr);
    }
  }

  @media (min-width: 769px) and (max-width: 1024px) {
    .events-grid {
      grid-template-columns: repeat(2, 1fr);
    }
  }
</style>
