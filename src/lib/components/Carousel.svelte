<script>
    let images = [
        { src: "\Carousel2.jpg", alt: "Carousel2" },
        { src: "\Carousel2.jpg", alt: "Carousel2" },
        { src: "\Carousel2.jpg", alt: "Carousel2" },
    ];

    let currentIndex = 0;

    const nextSlide = () => {
        currentIndex = (currentIndex + 1) % images.length;
    };

    const prevSlide = () => {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
    };
</script>

<div class="relative w-full h-[300px] overflow-hidden">
    <!-- Button Previous -->
    <button on:click={prevSlide} class="absolute left-0 top-1/2 transform -translate-y-1/2 text-white px-4 py-2 bg-black bg-opacity-50 z-10">‹</button>

    <!-- Carousel Slides -->
    <div class="flex transition-transform duration-500 ease-in-out" style="transform: translateX(-{currentIndex * 100}%)">
        {#each images as { src, alt }}
            <img src={src} alt={alt} class="carousel-image w-[248px] h-[196px] object-cover rounded-[35px]" />
        {/each}
    </div>

    <!-- Button Next -->
    <button on:click={nextSlide} class="absolute right-0 top-1/2 transform -translate-y-1/2 text-white px-4 py-2 bg-black bg-opacity-50 z-10">›</button>
</div>

<style>
    .relative {
        position: relative;
    }

    .flex {
        display: flex;
        transition: transform 0.5s ease-in-out;
    }

    .overflow-hidden {
        overflow: hidden;
    }

    /* Gaya untuk gambar carousel */
    .carousel-image {
        width: 248px;
        height: 196px;
        border-radius: 35px;
    }
</style>
