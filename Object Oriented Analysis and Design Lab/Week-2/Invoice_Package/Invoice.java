package Invoice_Package;

public class Invoice {
    // An Invoice should include four pieces of information as instance variables‐
    // a part number(type String),a part description(type String),
    // a quantity of the item being purchased (type int) and a 
    // price per item
    private String partNumber;
    private String partDescription;
    private int quantity;
    private double pricePerItem;

    // An Invoice should also include a constructor that accepts four arguments
    // and initializes the instance variables.
    public Invoice(String partNumber, String partDescription, int quantity, double pricePerItem) {
        this.partNumber = partNumber;
        this.partDescription = partDescription;
        this.quantity = quantity;
        this.pricePerItem = pricePerItem;

        if (this.quantity < 0) {
            this.quantity = 0;
        }
        if (this.pricePerItem < 0.0) {
            this.pricePerItem = 0.0;
        }
    }

    // An Invoice should also include a getter and setter
    // method for each instance variable.
    public String getPartNumber() {
        return partNumber;
    }
    public void setPartNumber(String partNumber) {
        this.partNumber = partNumber;
    }
    public String getPartDescription() {
        return partDescription;
    }
    public void setPartDescription(String partDescription) {
        this.partDescription = partDescription;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int qt){
        if (qt < 0) {
            this.quantity = 0;
        } else {
            this.quantity = qt;
        }
    }
    public double getPricePerItem() {
        return pricePerItem;
    }
    public void setPricePerItem(double pricePerItem) {
        if (pricePerItem < 0.0) {
            this.pricePerItem = 0.0;
        } else {
            this.pricePerItem = pricePerItem;
        }
    }
    // provide a method named getInvoice_ Amount that calculates the invoice amount 
    // (i.e., multiplies the quantity by the price per item), 
    // then returns the amount as a double value
    public double getInvoiceAmount() {
        return this.quantity * this.pricePerItem;
    }

}
