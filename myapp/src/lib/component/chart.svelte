<script>
    import { onMount } from "svelte";
    let chartCanvas;
    let chartInstance;
  
    // Export the chart's data and options as props
    export let chartData;
    export let chartOptions;
    export let chartType = "bar";
  
    onMount(async () => {
      const { Chart } = await import("chart.js/auto");
  
      // Define custom plugin for the pie chart to display total and percentage
      const pieChartPlugin = {
        id: 'pieChartLabels',
        afterDatasetsDraw(chart) {
          const { ctx, chartArea: { top, left, right, bottom, width, height }, scales: { x, y } } = chart;
          ctx.save();
  
          const total = chartData.datasets[0].data.reduce((a, b) => a + b, 0);
          ctx.font = 'bold 14px sans-serif';
          ctx.fillStyle = '#333';
          ctx.textAlign = 'center';
  
          // Display total number at the bottom of the pie chart
          ctx.fillText(`Total: ${total}`, left + width / 2, bottom + 20);
  
          // Display percentage for each dataset at the bottom
          const percentages = chartData.datasets[0].data.map(value => ((value / total) * 100).toFixed(2) + '%');
          ctx.fillText(`Percentage: ${percentages.join(', ')}`, left + width / 2, bottom + 40);
  
          ctx.restore();
        }
      };
  
      // Add the plugin to chartOptions
      const optionsWithPlugin = {
        ...chartOptions,
        plugins: {
          ...chartOptions.plugins,
          pieChartLabels: pieChartPlugin
        }
      };
  
      const ctx = chartCanvas.getContext("2d");
      chartInstance = new Chart(ctx, {
        type: chartType,
        data: chartData,
        options: optionsWithPlugin
      });
  
      return () => {
        chartInstance.destroy();
      };
    });
  </script>
  
  <canvas bind:this={chartCanvas}></canvas>
  
  <style>
    canvas {
      max-width: 100%;
      max-height: 400px;
    }
  </style>
  