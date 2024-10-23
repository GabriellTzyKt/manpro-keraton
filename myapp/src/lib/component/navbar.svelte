<script>
    export let page;
    export let user;
</script>

<div class="navbar">
    <div class="navbar-left">
      <h2>{page}</h2>
    </div>
    <div class="navbar-right">
        <div class="user">
            <span>{user}</span>
            <img src="../../../../src/lib/images/avatar.png" alt="avatar" class="avatar">
        </div>
    </div>
</div>

<style>
    .navbar {
        display: flex;
        height: 76px;
        justify-content: space-between;
        align-items: center;
        background-color: white;
        padding: 0px 20px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        position: sticky;
        top: 0;
        z-index: 100;
        font-family: sans-serif;
    }

    .navbar-left h2 {
        font-size: 1.5rem;
        margin: 0;
        padding-left: 12px;
        color: #212529;
    }

    .navbar-right {
        display: flex;
        align-items: center;
        height: 48px;
        padding: 0 12px; 
        font-weight: bold;
        color: #007bff;
        border: 2px solid #004DA3;
        border-radius: 10px;
        background-color: #fff; 
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1); 
    }

    .user {
        display: flex;
        align-items: center;
    }

    .navbar-right span {
        font-size: 24px;
        padding-right: 8px; 
        font-weight: bold;
        color: #004DA3; 
    }

    .avatar {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background-color: white; 
    }

</style>
