
async function getData() {
    const userId = localStorage.getItem('userID');

    const url = `https://localhost:7000/api/CartItems/AllItems/${userId}`;

    const response = await fetch(url);
    console.log("response",response);

        let data = await response.json();
        console.log("data",data);

        let cards = document.getElementById("CartMinu");
        let total = 0; // Initialize total to 0
        let totalQuantity = 0; // Initialize totalQuantity to 0 for quantity

        data.forEach((Item) => {
            let itemTotal = Item.product.price * Item.quantity;
            total += itemTotal;
            totalQuantity += Item.quantity;

            cards.innerHTML +=`
                                      

                           <div class="mini-cart-item clearfix"id="CartItemRow2${Item.cartItemId}">
                        <div class="mini-cart-img">
                            <a href="#"><img src="../../../../../../../Backend/E-Commerce/Product/${Item.product.image}" alt="Image"></a>
                          <a href="#"  onclick= "Delete(${Item.cartItemId})">  <span class="mini-cart-item-delete"><i class="icon-trash"></i></span></a>
                        </div>
                        <div class="mini-cart-info">
                            <h6><a href="#">${Item.product.name}</a></h6>
                            <span class="mini-cart-quantity">${Item.quantity} x $${Item.product.price}</span>
                        </div>
                    </div>
    `;
        });



    
      //  let cards2 = document.getElementById("CartTotals");

// Directly setting the innerHTML without any loop
Subtotal.innerHTML += `
$${Number(total.toFixed(2))}
`;


    
    let TotalQuantityDisplay = document.getElementById("totalQuantity");
    TotalQuantityDisplay.innerHTML = `${totalQuantity}`;


    let Subtotal2 = document.getElementById("Subtotal2");

    Subtotal2.innerHTML = "";

    Subtotal2.innerHTML = `
        $${total.toFixed(2)}
    `;
}

getData();
    






async function Delete(CartItemId){

const url = `https://localhost:7000/api/CartItems/${CartItemId}`;

const response = await fetch(url, {
method: 'DELETE'

});
alert(' deleted successfully!');
document.getElementById(`CartItemRow2${CartItemId}`).remove();
}

