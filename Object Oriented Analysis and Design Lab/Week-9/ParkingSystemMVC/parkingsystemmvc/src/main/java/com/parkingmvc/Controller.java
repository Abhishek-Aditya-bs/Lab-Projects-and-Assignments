package com.parkingmvc;

import javax.swing.JOptionPane;
import org.bson.Document;

public class Controller {
    
    private Model model;
    private View view;
    private Database database;

    public Controller(Model model, View view, Database database) {
        this.model = model;
        this.view = view;
        this.database = database;
    }

    public void initController() {
        view.getSubmitButton().addActionListener(e -> {
            String firstname = view.getFirstnameTextField().getText();
            if (firstname.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Firstname is required");
                return;
            }
            String lastname = view.getLastnameTextField().getText();
            if (lastname.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Lastname is required");
                return;
            }
            String address = view.getAddressTextField().getText();
            if (address.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Address is required");
                return;
            }
            String city = view.getCityTextField().getText();
            if (city.isEmpty()) {
                JOptionPane.showMessageDialog(null, "City is required");
                return;
            }
            String state = view.getStateTextField().getText();
            if (state.isEmpty()) {
                JOptionPane.showMessageDialog(null, "State is required");
                return;
            }
            String zip = view.getZipTextField().getText();
            if (zip.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Zip is required");
                return;
            }
            String phone = view.getPhoneTextField().getText();
            if (phone.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Phone is required");
                return;
            }
            String license = view.getLicenseTextField().getText();
            if (license.isEmpty()) {
                JOptionPane.showMessageDialog(null, "License is required");
                return;
            }
            String make = view.getMakeTextField().getText();
            if (make.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Make is required");
                return;
            }
            String car_model = view.getModelTextField().getText();
            if (car_model.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Model is required");
                return;
            }
            String color = view.getColorTextField().getText();
            if (color.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Color is required");
                return;
            }
            String plate = view.getPlateTextField().getText();
            if (plate.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Plate is required");
                return;
            }
            String parkingslot = view.getComboBox().getSelectedItem().toString();
            if (parkingslot == "Select a parking slot") {
                JOptionPane.showMessageDialog(null, "Parking slot is required");
                return;
            }
            if (database.isParkingSlotAvailable(parkingslot) == false) {
                JOptionPane.showMessageDialog(null, "Parking slot is not available");
                return;
            }
            model.setFirstname(firstname);
            model.setLastname(lastname);
            model.setAddress(address);
            model.setCity(city);
            model.setState(state);
            model.setZip(zip);
            model.setPhone(phone);
            model.setLicense(license);
            model.setMake(make);
            model.setModel(car_model);
            model.setColor(color);
            model.setPlate(plate);
            model.setParkingslot(parkingslot);

            Document document = new Document("firstname", model.getFirstname())
                    .append("lastname", model.getLastname())
                    .append("address", model.getAddress())
                    .append("city", model.getCity())
                    .append("state", model.getState())
                    .append("zip", model.getZip())
                    .append("phone", model.getPhone())
                    .append("license", model.getLicense())
                    .append("make", model.getMake())
                    .append("model", model.getModel())
                    .append("color", model.getColor())
                    .append("plate", model.getPlate())
                    .append("parkingslot", model.getParkingslot());

            database.insertDocument(document);

            view.getFirstnameTextField().setText("");
            view.getLastnameTextField().setText("");
            view.getAddressTextField().setText("");
            view.getCityTextField().setText("");
            view.getStateTextField().setText("");
            view.getZipTextField().setText("");
            view.getPhoneTextField().setText("");
            view.getLicenseTextField().setText("");
            view.getMakeTextField().setText("");
            view.getModelTextField().setText("");
            view.getColorTextField().setText("");
            view.getPlateTextField().setText("");
            view.getComboBox().setSelectedItem("Select a parking slot");

            JOptionPane.showMessageDialog(null, "Thank you for your using our parking system");
        });

        view.getClearButton().addActionListener(e -> {
            view.getFirstnameTextField().setText("");
            view.getLastnameTextField().setText("");
            view.getAddressTextField().setText("");
            view.getCityTextField().setText("");
            view.getStateTextField().setText("");
            view.getZipTextField().setText("");
            view.getPhoneTextField().setText("");
            view.getLicenseTextField().setText("");
            view.getMakeTextField().setText("");
            view.getModelTextField().setText("");
            view.getColorTextField().setText("");
            view.getPlateTextField().setText("");
            view.getComboBox().setSelectedItem("Select a parking slot");
        });

        view.getExitButton().addActionListener(e -> {
            database.closeConnection();
            System.exit(0);
        });
    }

}
