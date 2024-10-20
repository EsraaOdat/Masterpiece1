
//----------------------AddToCart-----------------------------------------



async function AddToCart(productId, quantity = 1) { // Default quantity is 1
    debugger;

    const userId = localStorage.getItem('userID');
    const getCartUrl = `https://localhost:7000/api/Carts`;

    if (!userId) {
        alert("You need to be logged in to add items to the cart.");
        return;
    }

    // Fetch all carts
    const response = await fetch(getCartUrl);
    if (!response.ok) {
        console.error("Error fetching carts");
        return;
    }

    let carts = await response.json();
    console.log('API Response:', carts);

    let userCart;

    carts.forEach(cart => {
        console.log(`Cart ID: ${cart.cartId}, User ID: ${cart.userId}, Status: ${cart.status}`);

        // Compare as strings to ensure matching
        if (String(cart.userId) === userId && cart.status === "open") {
            userCart = Number(cart.cartId); // Correctly converting cartId to a number
            console.log('Found open cart with ID:', userCart); // Log the found cart ID
        }
    });

    // If no open cart found, create a new one
    if (!userCart) {
        const createCartUrl = 'https://localhost:7000/api/Carts/CreateCart';

        var newCartRequest = {
            "userId": userId,
            "status": "open"
        };

        const createCartResponse = await fetch(createCartUrl, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(newCartRequest)
        });

        if (createCartResponse.ok) {
            const createResponse = await createCartResponse.json(); // Correctly get the response
            userCart = createResponse.cartId; // Get cartId from the response
        } else {
            console.error("Error creating new cart");
            return;
        }
    }

    // Prepare to add the product to the cart
    const addCartItemUrl = `https://localhost:7000/api/CartItems/AddItem`;

    var request = {
        cartId: userCart,
        productId: productId,
        quantity: quantity  // Use the passed quantity or default to 1
    };

    const addItemResponse = await fetch(addCartItemUrl, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(request)
    });

    if (addItemResponse.ok) {
        // alert("Product added to cart successfully");
        // window.location.reload(); // Refresh the page or navigate as needed
    } else {
        console.error("Error adding product to cart");
    }
}

//----------------------AddToCart-----------------------------------------
