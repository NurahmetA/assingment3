package Classes;

import java.util.ArrayList;

public class Cart extends Product implements Pay {
    private ArrayList<Product> products;
    public Cart() {
        this.products = new ArrayList<>();
    }
    public void addProduct(Product product) {
        products.add(product);
    }
    // Cart class
    public ArrayList<Product> getProductList() {
        return products;
    }

    public void setProductList(ArrayList<Product> productList) {
        this.products = productList;
    }

    public int showAllPrice() {
        int price = products.stream().mapToInt(Product::getProductPrice).sum();
        return price;
    }
}
