  // Apply the stored theme on page load
  document.addEventListener("DOMContentLoaded", () => {
    const theme = localStorage.getItem('theme') || 'light'; // Default to 'light'
    document.body.className = theme;
  });

  // Toggle theme between dark and light
  function toggleTheme() {
    let theme = localStorage.getItem('theme') === 'dark' ? 'light' : 'dark';
    localStorage.setItem('theme', theme);
    document.body.className = theme;
  }

  // Logout function preserving the theme
  function logoutAndClearStorage() {
    const theme = localStorage.getItem('theme'); // Save theme

    localStorage.clear(); // Clear all items
    if (theme) localStorage.setItem('theme', theme); // Restore theme

    window.location.href = 'Login.html'; // Redirect to login
  }


//   function updateNavbarForStoreOwner() {
//     const userType = localStorage.getItem('userType'); // Get the user type from localStorage
    
//     if (userType === 'StoreOwner') {
//        const addEmployeeLink = document.getElementById('addEmployeeLink');
//        addEmployeeLink.style.display = 'block';  // Show the "Add Employee" link
//     }
//  }

//  // Call the function when the page loads
//  window.onload = function() {
//     updateNavbarForStoreOwner();
//  };


