<script>
    import daysInAugust from './util'
    const daysByWeek = ['Minggu', 'Senin', 'Selasa', "Rabu",'Kamis', 'Jumat', 'Sabtu']
</script>

<div class="grid grid-cols-7">
    {#each daysByWeek as day}
        <div class="p-3 border">
            {day}
        </div>
    {/each}
</div>
<div class="grid grid-cols-7">
    <!-- {#each daysByWeek as day}
        <div>
            {#each {length: 5} as _, i}
                <div>
                    {i}
                </div>
            {/each}
        </div>
    {/each} -->

    {#each daysInAugust as day}
        <divc class="date">{day.date}</div>
    {/each}
</div>

<style lang="postcss">
    @tailwind components;
    @layer components{
        .date{
            @apply p-3 border;
        }
    }
</style>