import Invoice_Package.Invoice;

public class InvoiceClient {
    
    public static void main(String args[]){
        System.out.println("***** Invoice Client1 *****");
        Invoice invoice = new Invoice("1234", "Laptop", 10, 1000.00);
        System.out.println("Part Number: " + invoice.getPartNumber());
        System.out.println("Part Description: " + invoice.getPartDescription());
        System.out.println("Quantity: " + invoice.getQuantity());
        System.out.println("Price Per Item: " + invoice.getPricePerItem());
        System.out.println("Invoice Amount: " + invoice.getInvoiceAmount());
        // Set the price per item to 2000.00 and quantity to 20
        System.out.println("Setting the price per item to 2000.00 and quantity to 20");
        invoice.setPricePerItem(2000.00);
        invoice.setQuantity(20);
        System.out.println("Invoice Amount: " + invoice.getInvoiceAmount());
        System.out.println();
        System.out.println("***** Invoice Client2 *****");
        Invoice invoice2 = new Invoice("5678", "A100 GPU", 88, 4500.50);
        System.out.println("Part Number: " + invoice2.getPartNumber());
        System.out.println("Part Description: " + invoice2.getPartDescription());
        System.out.println("Quantity: " + invoice2.getQuantity());
        System.out.println("Price Per Item: " + invoice2.getPricePerItem());
        System.out.println("Invoice Amount: " + invoice2.getInvoiceAmount());
        // Set the price per item to 9000.25 and quantity to 163
        System.out.println("Setting the price per item to 9000.25 and quantity to 163");
        invoice2.setPricePerItem(9000.25);
        invoice2.setQuantity(163);
        System.out.println("Invoice Amount: " + invoice2.getInvoiceAmount());
    }

}
