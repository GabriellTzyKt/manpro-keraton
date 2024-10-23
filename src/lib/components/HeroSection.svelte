<script>
    import CarouselComponent from './Carousel.svelte';
</script>

<section class="relative bg-cover bg-center h-[700px]" style="background-image: url('\KeratonSoloBG.jpg">
    <div class="absolute inset-0 bg-black bg-opacity-50 flex flex-col justify-center items-center text-center text-white h-full">
        <h1 class="text-4xl md:text-6xl font-bold">Maha Menteri Keraton Surakarta</h1>
        <p class="mt-4 text-lg md:text-2xl">Deskripsi singkat mengenai Maha Menteri Keraton Surakarta</p>

        <!-- Carousel di bawah tulisan -->
        <div class="mt-8 text-2xl font-bold">
            Acara Mendatang
        </div>
        <div class="mt-8 flex justify-center w-full">
            <CarouselComponent />
        </div>
    </div>
</section>

<style>
    section {
        position: relative;
        height: 500px;
        background-size: cover;
        background-position: center;
    }

    /* Menambahkan gaya responsif */
    @media (min-width: 768px) {
        section {
            height: 700px;
        }
    }
</style>
