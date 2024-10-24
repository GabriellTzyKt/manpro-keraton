<script>
    export let page;
    export let page2;
    export let user;

    let showModal = false;
    let showConfirmModal = false; 
    let modalPosition = { top: 0, left: 0 };

    const openModal = (event, rowId) => {
        const buttonRect = event.target.getBoundingClientRect();
        modalPosition = {
            top: buttonRect.top + window.scrollY - buttonRect.height,
            left: buttonRect.left + window.scrollX,
        };
        selectedRowId = rowId;
        showModal = true;
        setTimeout(() => {
            document.addEventListener('click', handleOutsideClick);
        }, 0);
    };

    const closeModal = () => {
        showModal = false;
        document.removeEventListener('click', handleOutsideClick);
    };

    const handleOutsideClick = (event) => {
        const modalElement = document.querySelector('.modal');
        if (modalElement && !modalElement.contains(event.target)) {
            closeModal();
        }
    };

    const toggleConfirmModal = () => {
        showConfirmModal = !showConfirmModal;
    };

    const logout = () => {
        console.log("User logged out");
        toggleConfirmModal();
    };
</script>

<div class="navbar">
    <div class="navbar-left">
      <h2>{page||page2}</h2>
    </div>
    <div class="navbar-right" on:click={toggleConfirmModal}>
        <div class="user">
            <span>{user}</span>
            <img src="../../../../src/lib/images/avatar.png" alt="avatar" class="avatar">
        </div>
    </div>
</div>
{#if showConfirmModal}
    <div class="confirm-modal">
        <p>Are you sure you want to logout?</p>
        <button class="confirm-yes" on:click={logout} onclick="window.location.href='/'">Yes</button>
        <button on:click={toggleConfirmModal}>No</button>
    </div>
{/if}

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
    .confirm-modal {
        position: absolute;
        top: 80px;
        right: 20px;
        width: 200px;
        padding: 20px;
        background-color: white;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        font-family: sans-serif;
    }

    .confirm-modal button {
        margin: 10px 5px;
        padding: 8px 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .confirm-modal button.confirm-yes {
        background-color: #00d636 !important;
        color: white;
    }

    .confirm-modal button:last-child {
        color: white;
        background-color: #ff0000;
    }

</style>
