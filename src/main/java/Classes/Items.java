package Classes;

public class Items {
    String itemName;
    String itemPrice;
    public  Items() {

    }
    public Items(String itemName, String itemPrice) {
        this.itemName = itemName;
        this.itemPrice = itemPrice;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(String itemPrice) {
        this.itemPrice = itemPrice;
    }

    @Override
    public String toString() {
        return "Items{" +
                "itemName='" + itemName + '\'' +
                ", itemPrice='" + itemPrice + '\'' +
                '}';
    }
}
