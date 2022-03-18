let cartIcon = document.querySelector("#cart-icon");
let cart = document.querySelector(".cart");
let close = document.querySelector("#close-cart");

cartIcon.onclick = () =>{
    cart.classList.add("active");
}

close.onclick = () =>{
    cart.classList.remove("active");
}