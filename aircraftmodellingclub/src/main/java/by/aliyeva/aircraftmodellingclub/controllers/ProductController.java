package by.aliyeva.aircraftmodellingclub.controllers;

import by.aliyeva.aircraftmodellingclub.models.Cart;
import by.aliyeva.aircraftmodellingclub.models.CartItem;
import by.aliyeva.aircraftmodellingclub.models.Product;
import by.aliyeva.aircraftmodellingclub.models.User;
import by.aliyeva.aircraftmodellingclub.repositories.CartItemRepository;
import by.aliyeva.aircraftmodellingclub.services.CartService;
import by.aliyeva.aircraftmodellingclub.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;
    private final CartService cartService;
    private final CartItemRepository cartItemRepository;

    @GetMapping("/cart")
    public String getCart(@AuthenticationPrincipal User user, Model model, Principal principal) {
        Cart cart = cartService.getCartByUser(productService.getUserByPrincipal(principal));
        model.addAttribute("cart", cart);
        List<CartItem> cartItems = cartService.getCartItems(user);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("user", user);
        return "cart";
    }


    @PostMapping("/product/add/{id}")
    public String addToCart(@PathVariable Long id, Principal principal) {
        User user = productService.getUserByPrincipal(principal);
        Product product = productService.getProductById(id);
        cartService.addItemToCart(user, product);
        return "redirect:/";
    }

    @PostMapping("/cart/remove/{id}")
    public String removeFromCart(@PathVariable Long id, Principal principal) {
        User user = productService.getUserByPrincipal(principal);
        cartService.removeItemFromCart(user, id);
        return "redirect:/cart";
    }

    @PostMapping("/cart/update/{id}")
    public String updateCartItemQuantity(@PathVariable Long id, @RequestParam int quantity, Principal principal) {
        User user = productService.getUserByPrincipal(principal);
        cartService.updateCartItemQuantity(user, id, quantity);
        return "redirect:/cart";
    }

    @GetMapping("/")
    public String products(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model){
        model.addAttribute("products", productService.listProducts(title));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "products";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal){
        Product product = productService.getProductById(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        model.addAttribute("authorProduct", product.getUser());
        return "product-info";
    }

    @PostMapping("/product/create")
    public String createProduct(
            Product product,
            @RequestParam("file1") MultipartFile file1,
            @RequestParam("file2") MultipartFile file2,
            @RequestParam("file3") MultipartFile file3,
            Principal principal
            ) throws IOException {
        productService.saveProduct(principal, product, file1, file2, file3);
        return "redirect:/my/products";
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id, Principal principal) {
        productService.deleteProduct(productService.getUserByPrincipal(principal), id);
        return "redirect:/my/products";
    }

    @GetMapping("/my/products")
    public String userProducts(Principal principal, Model model) {
        User user = productService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("products", user.getProducts());
        return "my-products";
    }
}
